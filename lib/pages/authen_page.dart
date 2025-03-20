// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/widgets/custom_button.dart';
import 'package:project/widgets/custom_text_field.dart';

class AuthenPage extends StatefulWidget {
  const AuthenPage({super.key});

  @override
  State<AuthenPage> createState() => _AuthenPageState();
}

class _AuthenPageState extends State<AuthenPage> {
  late Widget _widget;
  late String _header;

  Widget _buildWelcomeWidget() {
    _header = 'Welcome';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: 'Sign In',
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF1042BF),
          onPressed: () => setState(() {
            _widget = _buildSignInWidget();
          }),
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Sign Up',
          backgroundColor: Color(0xFF1042BF),
          foregroundColor: Colors.white,
          onPressed: () => setState(() {
            _widget = _buildSignupWidget();
          }),
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Widget _buildSignInWidget() {
    _header = 'Sign In';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextField(
          hintText: 'Email',
          assetPath: 'assets/email.png',
        ),
        CustomTextField(
          hintText: 'Password',
          assetPath: 'assets/lock.png',
          obscureText: true,
        ),
        CustomButton(
          text: 'Sign In',
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF1042BF),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        CustomButton(
          text: 'Sign In With Google',
          backgroundColor: Color(0xFF1042BF),
          foregroundColor: Colors.white,
          onPressed: () {},
          icon: Image.asset("assets/google.png"),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account? ',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000).withAlpha(70),
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                _widget = _buildSignupWidget();
              }),
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Bai Jamjuree',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1042BF),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignupWidget() {
    _header = 'Create Account';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextField(
          hintText: 'Full Name',
          assetPath: 'assets/profile.png',
        ),
        CustomTextField(
          hintText: 'Email',
          assetPath: 'assets/email.png',
        ),
        CustomTextField(
          hintText: 'Password',
          assetPath: 'assets/lock.png',
          obscureText: true,
        ),
        CustomTextField(
          hintText: 'Confirm Password',
          assetPath: 'assets/lock.png',
          obscureText: true,
        ),
        CustomButton(
          text: 'Sign Up',
          backgroundColor: Color(0xFF1042BF),
          foregroundColor: Colors.white,
          onPressed: () {},
          fontWeight: FontWeight.w400,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000).withAlpha(70),
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                _widget = _buildSignInWidget();
              }),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Bai Jamjuree',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1042BF),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _widget = _buildWelcomeWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/background.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: Text(
                        _header,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Bai Jamjuree',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      left: -10,
                      right: -10,
                      child: Image.asset(
                        'assets/vector.png',
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: _widget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
