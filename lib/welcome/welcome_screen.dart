import 'package:bloc_form_validation/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_form_validation/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Example',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text('Sign in with Email'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SignInBloc(),
                        child: const SignInScreen(),
                      ),
                    ));
              },
            ),
            ElevatedButton(
              child: const Text('Sign in with Google'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
