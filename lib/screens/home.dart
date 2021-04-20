import 'package:flutter/material.dart';
import 'package:xenon/utilities/colors.dart';
import 'package:xenon/utilities/commonWidgets.dart';
import 'package:xenon/utilities/data.dart';
import 'package:xenon/utilities/sizeconfig.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/avatar.png', height: 100),
                SizedBox(height: 10),
                Text(
                  "Emily Cyrus",
                  textScaleFactor: 2,
                  style: TextStyle(color: pink, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 60),
                Text("Home", style: TextStyle(color: blue, fontSize: 22)),
                SizedBox(height: 10),
                Divider(),
                Text("Book a Nanny",
                    style: TextStyle(color: blue, fontSize: 22)),
                SizedBox(height: 10),
                Divider(),
                Text("How it Works",
                    style: TextStyle(color: blue, fontSize: 22)),
                SizedBox(height: 10),
                Divider(),
                Text("Why Nanny Vanny",
                    style: TextStyle(color: blue, fontSize: 22)),
                SizedBox(height: 10),
                Divider(),
                Text("My Bookings",
                    style: TextStyle(color: blue, fontSize: 22)),
                SizedBox(height: 10),
                Divider(),
                Text("My Profile", style: TextStyle(color: blue, fontSize: 22)),
                SizedBox(height: 10),
                Divider(),
                Text("Support",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    SizeConfig().init(context);
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          // color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 5,
                horizontal: SizeConfig.blockSizeVertical * 3,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        isCollapsed
                            ? Container()
                            : InkWell(
                                child: Image.asset('assets/icons/drawer.png',
                                    height: 40),
                                onTap: () {
                                  setState(() {
                                    if (isCollapsed)
                                      _controller.forward();
                                    else
                                      _controller.reverse();

                                    isCollapsed = !isCollapsed;
                                  });
                                },
                              ),
                        Spacer(),
                        InkWell(
                          child: Image.asset('assets/icons/drawer.png',
                              height: 40),
                          onTap: () {
                            setState(() {
                              if (isCollapsed)
                                _controller.forward();
                              else
                                _controller.reverse();

                              isCollapsed = !isCollapsed;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(children: [
                      Image.asset('assets/avatar.png', height: 64),
                      SizedBox(width: 16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              textScaleFactor: 1.3,
                              style: TextStyle(),
                            ),
                            Text(
                              "Emily Cyrus",
                              textScaleFactor: 1.6,
                              style: TextStyle(
                                  color: pink, fontWeight: FontWeight.bold),
                            ),
                          ])
                    ]),
                    SizedBox(height: SizeConfig.blockSizeVertical * 14),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              color: Color(0xFFF5B5CF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: SizeConfig.blockSizeVertical * 24,
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16),
                                Text(
                                  "Nanny & Babysitting\nServices",
                                  textScaleFactor: 1.6,
                                  style: TextStyle(
                                      color: blue, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                colourButton("Book Now", blue)
                              ]),
                        ),
                        Positioned(
                            right: -40,
                            bottom: -40,
                            child: Image.asset('assets/banner.png'),
                            height: SizeConfig.blockSizeVertical * 40),
                      ],
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Color(0xFFF5B5CF)
                                    : Color(0xFF80ABDB),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            height: SizeConfig.blockSizeVertical * 24,
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      colourButton(
                                          "Book Now",
                                          index % 2 == 0
                                              ? pink
                                              : Color(0xFF0098D0))
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text(
                                        homeData[index]["title"],
                                        textScaleFactor: 1.4,
                                        style: TextStyle(
                                            color: blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Text(
                                        "₹${homeData[index]["price"]}",
                                        textScaleFactor: 1.4,
                                        style: TextStyle(
                                            color: blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    homeData[index]["desc"],
                                    textScaleFactor: 0.8,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xFF494949),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(height: 16);
                        },
                        itemCount: homeData.length)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
