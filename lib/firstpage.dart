import 'package:flutter/material.dart';
import 'package:mathpuzzle/Utils.dart';
import 'package:mathpuzzle/puzzlepage.dart';
import 'package:mathpuzzle/secondpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  int? level;

  @override
  void initState() {
    super.initState();
    storepref();
  }

  storepref() async {
    Utils.prefs = await SharedPreferences.getInstance();
    level = Utils.prefs!.getInt('level') ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("splashimage/background.jpg"),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              //** TOP-PART **//
              Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Math Puzzles",
                  style: TextStyle(
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 30),
                ),
              ),
              //** CENTER-PART **//
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("splashimage/blackboard_main_menu.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [centerbtn(0), centerbtn(1), centerbtn(2)],
                    ),
                  ),
                ),
              ),
              //** BOTTOM-PART **//
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              bottombtn(0),
                              bottombtn(1),
                            ],
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(width: 1, color: Colors.black)),
                            onPressed: () {},
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget centerbtn(int i) {
    List<String> centerbtname = ["CONTINUE", "PUZZLES", "BUY PRO"];
    return OutlinedButton(
      onPressed: () {
        //** continue **//
        if (i == 0) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return secondpage(level!);
            },
          ));
        }
        //** puzzle **//
        else if (i == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              print(level);
              return puzzlepage(level!);
            },
          ));
        }
        //** buy pro **//
        else if (i == 2) {}
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          "${centerbtname[i]}",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: "family1"),
        ),
      ),
    );
  }

  Widget bottombtn(int i) {
    List<String> btnimage = [
      "splashimage/shareus.png",
      "splashimage/emailus.png"
    ];
    return InkWell(
      onTap: () {
        //** share **//
        if (i == 0) {
        }
        //** email **//
        else if (i == 1) {}
      },
      child: Container(
        height: 35,
        width: 35,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
            gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.white, Colors.blueGrey],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.center,
        child: Image.asset("${btnimage[i]}"),
      ),
    );
  }
}
