import 'package:flutter/material.dart';
import 'package:mathpuzzle/Utils.dart';
import 'package:mathpuzzle/firstpage.dart';
import 'package:mathpuzzle/levelpage2.dart';
import 'package:mathpuzzle/secondpage.dart';

class puzzlepage extends StatefulWidget {
  int level;

  puzzlepage(this.level);

  @override
  State<puzzlepage> createState() => _puzzlepageState();
}

class _puzzlepageState extends State<puzzlepage> {
  @override
  Widget build(BuildContext context) {
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
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("Select Puzzle",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(10),
                  child: GridView.builder(
                      // scrollDirection: Axis.vertical,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        // 0 : pending
                        // 1 : Clear
                        // 2 : lock
                        int status =
                            Utils.prefs!.getInt('level${index + 1}') ?? 2;
                        if (status == 1) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return secondpage(index + 1);
                                  },
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("splashimage/tick.png"),
                                        fit: BoxFit.fill),
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                              // Image(image: AssetImage("splashimage/lock.png")),
                              );
                        } else if (status == 0 || index < widget.level) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return secondpage(index + 1);
                                  },
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                              // Image(image: AssetImage("splashimage/lock.png")),
                              );
                        } else {
                          return Image(
                              image: AssetImage("splashimage/lock.png"));
                        }
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10)),
                )),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return levelpage2(widget.level);
                      },
                    ));
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Image(image: AssetImage("splashimage/next.png")),
                  ),
                )
              ],
            ),
          )),
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
}
