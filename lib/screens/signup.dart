import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenon/utilities/colors.dart';
import 'package:xenon/utilities/commonWidgets.dart';
import 'package:xenon/utilities/sizeconfig.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 2,
                horizontal: SizeConfig.blockSizeVertical * 4,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.blockSizeVertical * 8),
                    Center(
                      child: Image.asset('assets/login_logo.png',
                          height: SizeConfig.blockSizeVertical * 12),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 4),
                    Text("Sign Up to continue",
                        textScaleFactor: 2,
                        style: TextStyle(
                            color: blue, fontWeight: FontWeight.w500)),
                    SizedBox(height: SizeConfig.blockSizeVertical * 12),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20.0),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 8),
                                customTF("Parent Number",
                                    Icons.account_circle_outlined),
                                customTF("Mobile Number",
                                    Icons.phone_android_rounded),
                                customTF("Email Id", Icons.mail_outline),
                                customTF(
                                    "City", Icons.keyboard_arrow_down_outlined),
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 5),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text("Number Of Children",
                                        textScaleFactor: 1.4,
                                        style: TextStyle(color: pink))),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                        toggleable: true,
                                        value: 0,
                                        activeColor: pink,
                                        groupValue: _radioValue,
                                        onChanged: (_) {}),
                                    Text("1(One)", textScaleFactor: 1.2),
                                    Radio(
                                        toggleable: false,
                                        value: 1,
                                        activeColor: pink,
                                        groupValue: _radioValue,
                                        onChanged: (_) {}),
                                    Text("2(Two)", textScaleFactor: 1.2),
                                    Radio(
                                        toggleable: true,
                                        value: 2,
                                        activeColor: pink,
                                        groupValue: _radioValue,
                                        onChanged: (_) {}),
                                    Text("More", textScaleFactor: 1.2),
                                  ],
                                ),
                                SizedBox(height: 16),
                                customTF("Relation with Child",
                                    Icons.keyboard_arrow_down_outlined),
                                SizedBox(height: 16),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0),
                                        ),
                                        primary: pink),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 48.0),
                                      child: Text(
                                        'Next',
                                        textScaleFactor: 1.4,
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                                SizedBox(height: 16),
                                RichText(
                                  text: TextSpan(
                                      text: 'Don\'t Have An Account?',
                                      style:
                                          GoogleFonts.montserrat(color: blue),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '   Sign Up',
                                          style: GoogleFonts.montserrat(
                                              color: blue,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ]),
                                ),
                                SizedBox(height: 16),
                                Text('Forgot Password?',
                                    style: GoogleFonts.montserrat(
                                        color: pink,
                                        fontWeight: FontWeight.w300)),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: -40,
                            left: -24,
                            child: Image.asset('assets/clip.png',
                                height: SizeConfig.blockSizeVertical * 20))
                      ],
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      child: Text("Skip",
                          textScaleFactor: 1.4,
                          style: TextStyle(
                              color: blue, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
