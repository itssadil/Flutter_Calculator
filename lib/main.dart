import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // disable Landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  // MyApp
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  int fnum = 0;
  int snum = 0;
  String op = "";
  String res = "";
  String td = "";
  String av = "";

  void onBtn(String btnNum) {
    if (btnNum == 'C') {
      fnum = 0;
      snum = 0;
      res = "";
      td = "";
      av = "";
    } else if (btnNum == '+' ||
        btnNum == '-' ||
        btnNum == 'x' ||
        btnNum == '/' ||
        btnNum == '√') {
      fnum = int.parse(td);
      res = "";
      op = btnNum;
      av = (av + btnNum).toString();

      if (op == '√') {
        res = (sqrt(fnum)).toString();
      }
    } else if (btnNum == '=') {
      snum = int.parse(td);
      if (op == '+') {
        res = (fnum + snum).toString();
      } else if (op == '-') {
        res = (fnum - snum).toString();
      } else if (op == 'x') {
        res = (fnum * snum).toString();
      } else if (op == '/') {
        res = (fnum ~/ snum).toString();
      }
    } else {
      res = (td + btnNum).toString();
      av = (av + btnNum).toString();
    }
    setState(() {
      av;
      td = res;
    });
  }

  Widget CalBtn(
      {required String btnNum, Color? btnClr, Color? btClr, Color? btsClr}) {
    return Expanded(
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          primary: btnClr,
          onPrimary: btsClr, // <-- Splash color
        ),
        onPressed: () => onBtn(btnNum),
        child: Text(
          "$btnNum",
          style: TextStyle(color: btClr, fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                "$av",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                "$td",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                CalBtn(
                  btnNum: "C",
                  btnClr: Colors.deepOrangeAccent,
                  btClr: Colors.white,
                  btsClr: Colors.white,
                ),
                CalBtn(
                  btnNum: "√",
                  btnClr: Colors.deepOrangeAccent,
                  btClr: Colors.white,
                  btsClr: Colors.white,
                ),
                CalBtn(
                  btnNum: "%",
                  btnClr: Colors.deepOrangeAccent,
                  btClr: Colors.white,
                  btsClr: Colors.white,
                ),
                CalBtn(
                  btnNum: "⌫",
                  btnClr: Colors.black,
                  btClr: Colors.white,
                  btsClr: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CalBtn(btnNum: "9"),
                CalBtn(btnNum: "8"),
                CalBtn(btnNum: "7"),
                CalBtn(
                    btnNum: "+",
                    btnClr: Colors.deepPurpleAccent,
                    btClr: Colors.white,
                    btsClr: Colors.white)
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CalBtn(btnNum: "6"),
                CalBtn(btnNum: "5"),
                CalBtn(btnNum: "4"),
                CalBtn(
                    btnNum: "-",
                    btnClr: Colors.deepPurpleAccent,
                    btClr: Colors.white,
                    btsClr: Colors.white)
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CalBtn(btnNum: "3"),
                CalBtn(btnNum: "2"),
                CalBtn(btnNum: "1"),
                CalBtn(
                    btnNum: "x",
                    btnClr: Colors.deepPurpleAccent,
                    btClr: Colors.white,
                    btsClr: Colors.white)
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CalBtn(btnNum: "."),
                CalBtn(btnNum: "0"),
                CalBtn(
                    btnNum: "=",
                    btnClr: Colors.black,
                    btClr: Colors.white,
                    btsClr: Colors.white),
                CalBtn(
                    btnNum: "÷",
                    btnClr: Colors.deepPurpleAccent,
                    btClr: Colors.white,
                    btsClr: Colors.white)
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
