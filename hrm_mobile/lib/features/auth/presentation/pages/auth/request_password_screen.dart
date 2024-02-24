import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/core/util/snackbar_message.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class RequestPasswordScreen extends StatefulWidget {
  const RequestPasswordScreen({super.key});

  @override
  State<RequestPasswordScreen> createState() => _RequestPasswordScreenState();
}

class _RequestPasswordScreenState extends State<RequestPasswordScreen> {
  final SnackBarMessage snackBarMessage = SnackBarMessage();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Forgot password  ',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(120 / 360),
                      child: Icon(Icons.vpn_key,
                          color: Color(0xffFEC318), size: 30.0),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Lost your way? No worries! Just enter your email below.',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 30),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SendOTPSuccessState) {
                      Navigator.of(context).pushNamed('/validate-otp',
                          arguments: [emailController.text]);
                    } else if (state is ErrorAuthState) {
                      snackBarMessage.showErrorSnackBar(
                          message: state.message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return FilledButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(SendOTPEvent(
                            otpModel: OTPModel(email: emailController.text)));
                      },
                      child: const Text('Continue'),
                    );
                  },
                ),
              ],
            )));
  }
}
