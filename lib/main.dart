import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenon/utilities/colors.dart';
import 'package:xenon/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MaterialApp(
            title: "CartGeek",
            debugShowCheckedModeBanner: false,
            initialRoute: '/login',
            // home: Dashboard(),
            routes: routes,
            theme: ThemeData(
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
              primaryColor: pink,
              // appBarTheme: AppBarTheme(color: red)),
            ),
          )));
}
