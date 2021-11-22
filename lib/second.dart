import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'components/applocal.dart';

class second extends StatefulWidget {
  int score;
  String lang;

  second({this.score, this.lang});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  String txt1 = '1 Million & 800 thousand = 1\$';
  String share = "Share App ";
  String txt2 = '18 Million = 10\$';
  String txt3 = '180 Million = 100\$';
  String txt4 = '1 Billion & 800 Million = 1000\$';
  String txt5 = '';
  String Score = 'Your Score';

  @override
  void initState() {
    if (widget.lang == 'en') {
      txt1 = '1 Million & 800 thousand = 1\$';
      txt2 = '18 Million = 10\$';
      share = "Share App ";
      txt3 = '180 Million = 100\$';
      txt4 = '1 Billion & 800 Million = 1000\$ ';
      txt5 = 'Closed until app have 1 Million download';

      Score = "Your Score = ";
    } else if (widget.lang == 'ar') {
      txt1 = "مليون و 800 الف = 1 دولار";
      txt2 = " م18مليون = 10 دولار";
      txt3 = " م180مليون = 100 دولار";
      txt4 = ' مليار و 800 مليون = 1000 دولار';
      txt5 = 'مغلق حتي  يتم مليون تنزيل ';
      share = "مشاركة التطبيق ";
      Score = 'نقاطك = ';
    } else if (widget.lang == 'h') {
      txt1 = '1 मिलियन और 800 हजार = 1\$';
      txt2 = '18 मिलियन = 10\$';
      txt3 = '180 मिलियन = 100\$';
      share = 'ऐप शेयर करें';
      txt4 = '1 बिलियन और 800 मिलियन = 1000\$';
      txt5 = 'ऐप के 1 मिलियन डाउनलोड होने तक बंद';
      Score = 'अपने स्कोर = ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: Text(
          //   "Details",
          //   style: TextStyle(color: Colors.white, fontSize: 21),
          // ),
        ),
        body: Container(
            color: Colors.amberAccent,
            child: ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        // Score
                        "${getLang(context, "scoree")}" +
                            " : " +
                            widget.score.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                          color: Colors.blueAccent,
                          height: 230,
                          child: Image.asset('assets/ww.jfif')),
                      SizedBox(height: 30),
                      Text(
                        "${getLang(context, "txt11")}",
                        // txt1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(
                        // txt2,
                        "${getLang(context, "txt2")}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(
                          //txt3,
                          "${getLang(context, "txt3")}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Text(
                            "${getLang(context, "txt44")}",
                            //  txt4,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${getLang(context, "txt5")}",
                            // txt5,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      FlatButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text(
                            "${getLang(context, "share")}",
                          )),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: CurvedNavigationBar(
                            color: Colors.white,
                            backgroundColor: Colors.deepOrangeAccent,
                            index: 1,
                            //buttonBackgroundColor:Colors.blue,
                            items: <Widget>[
                              Icon(Icons.home, size: 24, color: Colors.black),
                              //   Icon(Icons.add_box,size:24,color:Colors.red),
                              Icon(Icons.ad_units_sharp,
                                  size: 24, color: Colors.red),
                              //  Icon(Icons.settings, size: 24, color: Colors.cyan),
                            ],
                            animationCurve: Curves.bounceOut,
                            onTap: (index) async {
                              if (index == 0) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Pomodoro();
                                }));
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
