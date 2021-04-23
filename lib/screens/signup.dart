import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenon/utilities/colors.dart';
import 'package:xenon/utilities/commonWidgets.dart';
import 'package:xenon/utilities/services.dart';
import 'package:xenon/utilities/sizeconfig.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _radioValue = 1;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = GlobalKey<FormState>();
  TextEditingController parent = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController relation = new TextEditingController();
  TextEditingController noChild = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
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
              ),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                              elevation: 2.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20.0),
                                child: Container(
                                  width: SizeConfig.blockSizeVertical * 32,
                                  child: Form(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height:
                                                SizeConfig.blockSizeVertical * 8),
                                        customTF(
                                            "Parent Number",
                                            Icons.account_circle_outlined,
                                            parent),
                                        customTF("Mobile Number",
                                            Icons.phone_android_rounded, mobile),
                                        customTF("Email Id", Icons.mail_outline,
                                            email),
                                        customTF(
                                            "City",
                                            Icons.keyboard_arrow_down_outlined,
                                            city),
                                        SizedBox(
                                            height:
                                                SizeConfig.blockSizeVertical * 5),
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text("Number Of Children",
                                                textScaleFactor: 1.4,
                                                style: TextStyle(color: pink))),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: Radio(
                                                  toggleable: true,
                                                  value: 1,
                                                  activeColor: pink,
                                                  groupValue: _radioValue,
                                                  onChanged: (value) =>
                                                      _currectRadio(value)),
                                            ),
                                            Text("1(One)", textScaleFactor: 1.2),
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: Radio(
                                                  toggleable: false,
                                                  value: 2,
                                                  activeColor: pink,
                                                  groupValue: _radioValue,
                                                  onChanged: (value) =>
                                                      _currectRadio(value)),
                                            ),
                                            Text("2(Two)", textScaleFactor: 1.2),
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: Radio(
                                                  toggleable: true,
                                                  value: 3,
                                                  activeColor: pink,
                                                  groupValue: _radioValue,
                                                  onChanged: (value) =>
                                                      _currectRadio(value)),
                                            ),
                                            Text("More", textScaleFactor: 1.2),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        customTF(
                                            "Relation with Child",
                                            Icons.keyboard_arrow_down_outlined,
                                            relation),
                                        SizedBox(height: 16),
                                        ElevatedButton(
                                            onPressed: () {
                                              final isValid = _formKey
                                                  .currentState
                                                  .validate();
                                              if (isValid)
                                                Services()
                                                    .registerUser(
                                                        parent.text,
                                                        email.text,
                                                        mobile.text,
                                                        _radioValue.toString(),
                                                        relation.text)
                                                    .then((value) =>
                                                        showInSnackBar(
                                                            _scaffoldKey,
                                                            value['message'],
                                                            (_) {
                                                          print(value['success']);
                                                          if (value['success'])
                                                            Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    '/login');
                                                        }));
                                              _formKey.currentState.save();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          30.0),
                                                ),
                                                primary: pink),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 8.0,
                                                  horizontal: 48.0),
                                              child: Text(
                                                'Next',
                                                textScaleFactor: 1.4,
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            )),
                                        SizedBox(height: 16),
                                        InkWell(
                                          onTap: () =>
                                              Navigator.pushReplacementNamed(
                                                  context, '/login'),
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Already Have An Account?',
                                                style: GoogleFonts.montserrat(
                                                    color: blue),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '   Sign In',
                                                    style: GoogleFonts.montserrat(
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ]),
                                          ),
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
                          onPressed: () =>
                              Navigator.pushReplacementNamed(context, '/home'),
                          child: Text("Skip",
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                  color: blue, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _currectRadio(int value) {
    setState(() {
      _radioValue = value;
    });
    print(_radioValue);
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
