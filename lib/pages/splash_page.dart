import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeWidget = Column(
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
          onPressed: () {},
          child: Text(
            'Sign Up',
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
          onPressed: () {},
          child: Text(
            'Log In',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Bai Jamjuree',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );

    final loginWidget = Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
          // const SizedBox(height: 30),
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
            onPressed: () {},
            child: Text(
              'Sign Up',
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
                fontSize: 22,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // const SizedBox(width: 10),
          Text.rich(
            TextSpan(
              text: 'Don’t have an account?',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Bai Jamjuree',
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000).withAlpha(70),
              ),
              children: [
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Bai Jamjuree',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1042BF),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
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
                      'Welcome',
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
              flex: 1,
              child: Container(
                child: loginWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
