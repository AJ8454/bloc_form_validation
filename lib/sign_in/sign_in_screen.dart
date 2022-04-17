import 'package:bloc_form_validation/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In with Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email Address',
              ),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                  emailValue: emailController.text,
                  passwordValue: passwordController.text,
                ));
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text));
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CupertinoButton(
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  child: const Text('Sign In'),
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context)
                          .add(SignInSubmittedEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
