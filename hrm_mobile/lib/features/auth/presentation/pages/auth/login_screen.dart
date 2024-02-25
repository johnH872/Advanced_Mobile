import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/core/util/snackbar_message.dart';
import 'package:hrm_mobile/features/auth/data/models/login_model.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SnackBarMessage snackBarMessage = SnackBarMessage();

  final loginForm = FormGroup({
    "email": FormControl<String>(
        validators: [Validators.email, Validators.required]),
    "password": FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
      Validators.maxLength(20)
    ])
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loginForm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ReactiveForm(
              formGroup: loginForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Welcome back  ',
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                      Icon(Icons.waving_hand,
                          color: Color(0xffFEC318), size: 30.0),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'to ',
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                      Text(
                        'HRM System',
                        style: TextStyle(
                            color: lightColorScheme.primary,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Hello there, log in to continue ',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  ReactiveTextField(
                    formControlName: 'email',
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 30),
                  ReactiveTextField(
                    formControlName: 'password',
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/forgot-password');
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: lightColorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(height: 30),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is LoggedInState) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/home', (r) => false);
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
                            onPressed: loginForm.valid ? () {
                              if(loginForm.valid) {
                                BlocProvider.of<AuthBloc>(context).add(LogInEvent(
                                    loginModel: LoginModel(
                                        email: loginForm.control('email').value,
                                        password: loginForm.control('password').value)));
                              }
                            } : null,
                            child: const Text('Login'),
                        );}
                      ); 
                    },
                  ),
                ],
              ))),
    );
  }
}
