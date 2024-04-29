// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SuccessDialog extends StatefulHookWidget {
  final String content;
  final String title;
  const SuccessDialog({Key? key, required this.content, required this.title}) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
          side: BorderSide(color: Color(0xff005A23), width: 1.5)),
      contentPadding: EdgeInsets.zero,
      // insetPadding: EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: IconButton(
                onPressed: () { Navigator.pop(context, 'true');},
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Color(0xff005A23),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                widget.content,
                style: const TextStyle(fontSize: 18, color: Color(0xff005A23), fontWeight: FontWeight.w500),
              ),
            ),
            const Image(
              width: 240,
              height: 240,
              image: NetworkImage(
                  'https://res.cloudinary.com/dudtu2qef/image/upload/v1714206490/success_croccodile_auizf1.png'),
            )
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context, 'true'),
                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff005A23))),
                      child: const Text("Continue"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
