import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/core/util/snackbar_message.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String email;
  const ChangePasswordScreen({required this.email, super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final SnackBarMessage snackBarMessage = SnackBarMessage();
  final form = FormGroup({
    "password": FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
      Validators.maxLength(20)
    ]),
    "confirmPassword": FormControl<String>(),
  }, validators: [const MustMatchValidator('password', 'confirmPassword', true)]);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ReactiveForm(
              formGroup: form, 
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
                  'Please enter your new password.',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 30),
                ReactiveTextField(
                  formControlName: 'password',
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter new password',
                  ),
                ),
                const SizedBox(height: 30),
                ReactiveTextField(
                  formControlName: 'confirmPassword',
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Re-enter password',
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
                    return ReactiveFormConsumer(builder: (context, formGroup, child) {
                      return FilledButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: form.valid ? () {
                          BlocProvider.of<AuthBloc>(context).add(
                              ChangePasswordEvent(
                                  otpModel: OTPModel(
                                      email: widget.email,
                                      password: form.control('password').value)));
                        } : null,
                        child: const Text('Change'),
                      );
                    });
                    
                  },
                ),
              ],
            )))
            );
  }
}
