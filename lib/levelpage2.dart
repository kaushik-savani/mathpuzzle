import 'package:flutter/material.dart';
import 'package:mathpuzzle/Utils.dart';
import 'package:mathpuzzle/puzzlepage.dart';
import 'package:mathpuzzle/secondpage.dart';

class levelpage2 extends StatefulWidget {
  int level;

  levelpage2(this.level);

  @override
  State<levelpage2> createState() => _levelpage2State();
}

class _levelpage2State extends State<levelpage2> {
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
                        Utils.prefs!.getInt('level${index + 20 + 1}') ?? 2;
                    if (status == 1) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return secondpage(index + 20 + 1);
                              },
                            ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("splashimage/tick.png"),
                                    fit: BoxFit.fill),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${index + 20 + 1}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                          // Image(image: AssetImage("splashimage/lock.png")),
                          );
                    } else if (status == 0 || (index + 20) < widget.level) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return secondpage(index + 20 + 1);
                              },
                            ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${index + 20 + 1}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                          // Image(image: AssetImage("splashimage/lock.png")),
                          );
                    } else {
                      return Image(image: AssetImage("splashimage/lock.png"));
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
                    return puzzlepage(widget.level);
                  },
                ));
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: Image(image: AssetImage("splashimage/back.png")),
              ),
            )
          ],
        ),
      )),
    );
  }
}
