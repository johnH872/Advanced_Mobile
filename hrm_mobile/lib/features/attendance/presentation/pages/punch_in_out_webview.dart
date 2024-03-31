import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PunchInOutWebView extends StatefulWidget {
  const PunchInOutWebView({super.key});

  @override
  State<PunchInOutWebView> createState() => _PunchInOutWebViewState();
}

class _PunchInOutWebViewState extends State<PunchInOutWebView> {
  final WebViewController controller = WebViewController();
  late WebViewWidget webViewWidget;

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('http://10.0.2.2:4200'));
    webViewWidget = WebViewWidget(controller: controller);
    // if (WebViewPlatform.instance is WebKitWebViewPlatform) {
    //   final WebKitWebViewWidget webKitWidget = webViewWidget.platform as WebKitWebViewWidget;
    // } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
    //   final AndroidWebViewWidget androidWidget = webViewWidget.platform as AndroidWebViewWidget;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
            title: "Punch in/out",
            leadingIcon: null,
            button_1: null,
            isDisableBellIcon: true,
          ),
      body: webViewWidget,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
