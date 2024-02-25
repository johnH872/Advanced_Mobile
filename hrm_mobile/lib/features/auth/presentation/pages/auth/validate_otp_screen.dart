import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/core/util/snackbar_message.dart';
import 'package:hrm_mobile/features/auth/data/models/otp_model.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ValidateOTPScreen extends StatefulWidget {
  final String email;
  const ValidateOTPScreen({required this.email, super.key});

  @override
  State<ValidateOTPScreen> createState() => _ValidateOTPScreenState();
}

class _ValidateOTPScreenState extends State<ValidateOTPScreen> {
  final SnackBarMessage snackBarMessage = SnackBarMessage();
  final form = FormGroup({
    "otp": FormControl<String>(
        validators: [Validators.required, Validators.maxLength(8), Validators.minLength(8)]),
  });

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
                    Flexible(
                      child: Text(
                        'Enter verification code  ',
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'We have sent the code verification to your email.',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 30),
                ReactiveTextField(
                  formControlName: "otp",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Verification code',
                  ),
                ),
                const SizedBox(height: 30),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is ValidOTPState) {
                      Navigator.of(context).pushNamed('/change-password',
                          arguments: [widget.email]);
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
                          BlocProvider.of<AuthBloc>(context).add(ValidateOTPEvent(
                              otpModel: OTPModel(
                                  email: widget.email, otp: form.control('otp').value)));
                        } : null,
                        child: const Text('Verify'),
                      );
                    });
                    
                  },
                ),
              ],
            ))),
            );
  }
}
