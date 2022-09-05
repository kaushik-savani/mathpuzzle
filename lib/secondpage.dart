import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzle/Utils.dart';
import 'package:mathpuzzle/firstpage.dart';
import 'package:mathpuzzle/thirdpage.dart';

class secondpage extends StatefulWidget {
  int level;

  secondpage(this.level);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  List<int> number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int level = 1;
  List<String> ans = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35"
  ];
  String answerbyuser = "";

  @override
  void initState() {
    super.initState();
    level = widget.level;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("splashimage/gameplaybackground.jpg"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  toppart(),
                  //**LEVEL-IMAGE**//
                  Expanded(
                    child: Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset("splashimage/p$level.png")),
                  ),
                  Container(
                    color: Colors.black,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        //** TEXT-FIELD **//
                        Expanded(
                          child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text("$answerbyuser",
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //** DELETE **//
                        InkWell(
                          onTap: () {
                            if (answerbyuser.isNotEmpty) {
                              setState(() {
                                answerbyuser = answerbyuser.substring(
                                    0, answerbyuser.length - 1);
                              });
                            }
                          },
                          child: Image(
                            image: AssetImage("splashimage/delete.png"),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //** SUBMIT **//
                        TextButton(
                          onPressed: () async {
                            // 0 : pending
                            // 1 : Clear
                            // 2 : skip
                            if (ans[level - 1] == answerbyuser) {
                              if (level < ans.length) {
                                int status =
                                    Utils.prefs!.getInt('level$level') ?? 0;
                                if (status == 0) {
                                  await Utils.prefs!.setInt('level$level', 1);
                                  level++;
                                  await Utils.prefs!.setInt('level', level);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return thirdpage(level);
                                    },
                                  ));
                                } else if (status == 1) {
                                  level++;
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return thirdpage(level);
                                    },
                                  ));
                                } else if (status == 2) {
                                  await Utils.prefs!.setInt('level$level', 1);
                                  level++;
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return thirdpage(level);
                                    },
                                  ));
                                }
                              }
                            } else {
                              setState(() {
                                answerbyuser = "";
                              });
                              Fluttertoast.showToast(
                                  msg: "Wrong!!!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Row(
                      children: [
                        btn(0),
                        btn(1),
                        btn(2),
                        btn(3),
                        btn(4),
                        btn(5),
                        btn(6),
                        btn(7),
                        btn(8),
                        btn(9)
                      ],
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

  Widget toppart() {
    return Container(
      height: 70,
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          //**SKIP**//
          InkWell(
              onTap: () async {
                if (level < ans.length) {
                  int status = Utils.prefs!.getInt('level$level') ?? 0;

                  if (status == 0) {
                    await Utils.prefs!.setInt('level$level', 2);
                    level++;
                    await Utils.prefs!.setInt('level', level);

                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(level);
                      },
                    ));
                  } else if (status == 1 || status == 2) {
                    int level = Utils.prefs!.getInt('level') ?? 0;
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(level);
                      },
                    ));
                  }
                }
              },
              child: Container(
                  height: 40,
                  child: Image(
                    image: AssetImage("splashimage/skip.png"),
                  ))),
          SizedBox(
            width: 20,
          ),
          //**LEVELBOARD**//
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("splashimage/level_board.png"),
                      fit: BoxFit.fill)),
              child: Text(
                "Puzzle ${level}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          //**HINT**//
          InkWell(
            onTap: () {},
            child: Container(
                height: 40,
                child: Image(
                  image: AssetImage("splashimage/hint.png"),
                )),
          )
        ],
      ),
    );
  }

  btn(int i) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            answerbyuser = "$answerbyuser$i";
          });
        },
        child: Container(
          height: 40,
          margin: EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.grey.shade800,
          ),
          child: Text(
            "${number[i]}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
