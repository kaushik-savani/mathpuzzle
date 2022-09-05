import 'package:flutter/material.dart';
import 'package:mathpuzzle/Utils.dart';
import 'package:mathpuzzle/firstpage.dart';
import 'package:mathpuzzle/secondpage.dart';

class thirdpage extends StatefulWidget {
  int level;

  thirdpage(this.level);

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double height = size.height;
    double width = size.width;

    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("splashimage/background.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  //** TOP PART **//
                  Container(
                    height: height * .1,
                    alignment: Alignment.center,
                    child: Text("PUZZLE ${widget.level - 1} COMPLETED",
                        style: TextStyle(
                            color: Colors.indigoAccent, fontSize: 20)),
                  ),
                  //** CENTER-PART **//
                  Container(
                    height: height * .3,
                    width: 150,
                    child: Image(
                      image: AssetImage("splashimage/trophy.png"),
                      height: height * .4,
                      width: width * .1,
                      fit: BoxFit.fill,
                    ),
                  ),
                  btn(0, height, width),
                  btn(1, height, width),
                  btn(2, height, width),
                  //** BOTTOM-PART **//
                  Container(
                    height: height * .1,
                    alignment: Alignment.center,
                    child: Text("SHARE THIS PUZZLE",
                        style: TextStyle(
                            color: Colors.indigoAccent, fontSize: 20)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * .05,
                      width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.solid),
                          gradient: LinearGradient(
                              colors: [
                                Colors.blueGrey,
                                Colors.white,
                                Colors.blueGrey
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Image.asset("splashimage/shareus.png"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: goback);
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
    return Future.value();
  }

  Widget btn(int i, double height1, double width1) {
    List<String> btname = ["CONTINUE", "MAIN MENU", "BUY PRO"];

    return InkWell(
      onTap: () {
        //** CONTINUE **//
        if (i == 0) {
          int level = Utils.prefs!.getInt('level') ?? 1;
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return secondpage(level);
            },
          ));
        }
        //** MAIN MENU **//
        else if (i == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return firstpage();
            },
          ));
        }
        //** BUY PRO **//
        else if (i == 3) {}
      },
      child: Container(
        height: height1 * .06,
        width: 160,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.shade300,
              Colors.white,
              Colors.blueGrey.shade300,
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        child: Text(
          "${btname[i]}",
          style: TextStyle(
              color: Colors.black,
              fontSize: height1 * .02,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
