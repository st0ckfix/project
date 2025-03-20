// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:project/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Widget _widget;
  late String _header;

  Widget _buildWelcomeWidget() {
    _header = 'Welcome';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(290, 63),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            foregroundColor: Color(0xFF1042BF),
            shape: StadiumBorder(
              side: BorderSide(
                color: Color(0xFF1042BF),
                width: 3,
              ),
            ),
          ),
          onPressed: () => setState(() {
            _widget = _buildSignInWidget();
          }),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(290, 63),
            backgroundColor: Color(0xFF1042BF),
            foregroundColor: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(
                color: Color(0xFF1042BF),
                width: 3,
              ),
            ),
          ),
          onPressed: () => setState(() {
            _widget = _buildSignupWidget();
          }),
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInWidget() {
    _header = 'Sign In';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Color(0xFF1042BF).withValues(alpha: .2),
                fontSize: 20,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/email.png",
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Color(0xFF1042BF).withValues(alpha: .2),
                fontSize: 20,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/lock.png",
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(290, 63),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            foregroundColor: Color(0xFF1042BF),
            shape: StadiumBorder(
              side: BorderSide(
                color: Color(0xFF1042BF),
                width: 3,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // const SizedBox(height: 20),
        ElevatedButton.icon(
          icon: Image.asset("assets/google.png"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(290, 63),
            backgroundColor: Color(0xFF1042BF),
            foregroundColor: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(
                color: Color(0xFF1042BF),
                width: 3,
              ),
            ),
          ),
          onPressed: () {},
          label: Text(
            'Sign In With Google',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
          ),
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Full Name',
              hintStyle: TextStyle(
                color: Color(0xFF1042BF).withValues(alpha: .2),
                fontSize: 20,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/profile.png",
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Color(0xFF1042BF).withValues(alpha: .2),
                fontSize: 20,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/email.png",
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Color(0xFF1042BF).withValues(alpha: .2),
                fontSize: 20,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/lock.png",
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              hintStyle: TextStyle(
                color: Color(0xFF1042BF).withValues(alpha: .2),
                fontSize: 20,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/lock.png",
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        Hero(
          tag: 'signup',
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(290, 63),
              backgroundColor: Color(0xFF1042BF),
              foregroundColor: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(
                  color: Color(0xFF1042BF),
                  width: 3,
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
