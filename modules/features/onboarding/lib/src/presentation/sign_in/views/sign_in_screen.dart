import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'sign-in';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final formKeyValidation = GlobalKey<FormState>();

  void _onTapSubmit() {
    context.read<SignInBloc>().add(SubmitSignInEvent(
          email: _emailController.text,
          password: _passController.text,
        ));
  }

  void _onChangedInput(String value) {
    final isEnable = formKeyValidation.currentState?.validate() ?? false;

    context.read<SignInBloc>().add(UserInputChanged(isEnable: isEnable));
  }

  void _listenerSignInBloc(context, state) {
    if (state is SingInSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text('Welcome back!'),
        ),
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil('dashboard', (route) => false);
    } else if (state is SingInFailed) {
      final snackBar = SnackBar(
        content: Text(state.msg),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: AutoHideKeyboard(
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 4,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Form(
                            key: formKeyValidation,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                  ),
                                  controller: _emailController,
                                  validator: (s) {
                                    if (s?.isEmpty ?? true) {
                                      return 'Email not empty';
                                    }
                                    if (s?.contains('@') ?? false) {
                                      return null;
                                    }

                                    return 'email not correct format';
                                  },
                                  onChanged: _onChangedInput,
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                  ),
                                  controller: _passController,
                                  validator: (s) {
                                    if (s?.isEmpty ?? true) {
                                      return 'Password not empty';
                                    }
                                    return null;
                                  },
                                  onChanged: _onChangedInput,
                                ),
                                const SizedBox(height: 10.0),
                                BlocConsumer<SignInBloc, SignInState>(
                                  listener: _listenerSignInBloc,
                                  builder: (context, state) {
                                    final isLoading = state is SignInLoading ||
                                        state is SingInSuccess;

                                    return ElevatedButton(
                                      onPressed: !state.isEnableSubmit
                                          ? null
                                          : isLoading
                                              ? () {}
                                              : _onTapSubmit,
                                      child: isLoading
                                          ? const JumpingDotAnimation(
                                              color: Colors.white)
                                          : const Text('Submit'),
                                    );
                                  },
                                ),
                                const SizedBox(height: 10.0),
                                const Text('Forgot password?'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
