import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenon/utilities/colors.dart';
import 'package:xenon/utilities/sizeconfig.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    Text("Sign in to continue",
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
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: pink)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: pink)),
                                      suffixIcon: Icon(
                                          Icons.phone_android_rounded,
                                          color: pink)),
                                ),
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 5),
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
                                        'Verify',
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
                            child: Image.asset(
                              'assets/clip.png',
                              height: SizeConfig.blockSizeVertical * 20,
                            ))
                      ],
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () =>Navigator.pushNamed(context, '/signUP'),
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
