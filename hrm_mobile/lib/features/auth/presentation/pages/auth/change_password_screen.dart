import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/core/util/snackbar_message.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String email;
  const ChangePasswordScreen({required this.email, super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final SnackBarMessage snackBarMessage = SnackBarMessage();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
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
                      'Enter new password  ',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please enter yuor new password.',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New password',
                  ),
                ),
                const SizedBox(height: 30),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is ChangePasswordSuccess) {
                      snackBarMessage.showSuccessSnackBar(
                          message: state.message, context: context);
                      // Navigator.of(context).pushNamed('/validate-otp');
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
                        BlocProvider.of<AuthBloc>(context).add(
                            ChangePasswordEvent(
                                otpModel: OTPModel(
                                    email: widget.email,
                                    password: passwordController.text)));
                      },
                      child: const Text('Change'),
                    );
                  },
                ),
              ],
            )));
  }
}
