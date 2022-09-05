import 'package:flutter/material.dart';
import 'package:mathpuzzle/firstpage.dart';

void main() {
  runApp(MaterialApp(
    home: mathpuzzle(),
  ));
}

class mathpuzzle extends StatefulWidget {
  const mathpuzzle({Key? key}) : super(key: key);

  @override
  State<mathpuzzle> createState() => _mathpuzzleState();
}

class _mathpuzzleState extends State<mathpuzzle> {
  @override
  void initState() {
    super.initState();
    gonext();
  }

  gonext() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
