

import 'dart:async';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_api/second.dart';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startapp/startapp.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/applocal.dart';


SharedPreferences mySharedPreferences;


class Pomodoro extends StatefulWidget {
  String lan;
  //Language language = Language();
  Pomodoro({this.lan});
  @override
  _State createState() => _State();
}

class _State extends State<Pomodoro> {
  //String language = widget.lan.toString();
  int money = 0;
  // Language language = Language();
  bool stop = false;
  String txt1;
  bool ads = false;
  String watch = "watch ads";
  SharedPreferences prefs;
  int score = 0;
  double percent = 0;
  String message =
      'Your Score should have more than or equal 1 million and 800 to request money ';
  static int timeInMinut = 1;
  static int timeInSec = timeInMinut * 60;
  Timer timer;
  Color color = Colors.orangeAccent;
  Color color2 = Colors.grey;
  RewardedVideoAd videoAd = RewardedVideoAd.instance;
  String txt = 'Minning';
  bool videoCompleted = false;
  String error = '';
  String minning = 'minning';
  String scoree = 'score';
  String request = "Request";
  String txt4 = 'Continue minning';

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-4801644190189400~6035455652');
    setState(() {
      getData();
   //   getlang();
    });
    // if (widget.lan == 'en') {
    //   minning = 'Minning';
    //   message =
    //       'Your Score should have more than or equal 1 million and 800 to request money ';
    //   scoree = 'Score';
    //   request = 'Request money';
    //   txt = "Minning";
    //   txt1 = "Watch ads to continue";
    //   watch = 'Watch ads';
    //   txt4 = 'Continue minning';
    // } else if (widget.lan == 'ar') {
    //   minning = 'التعدين';
    //   scoree = "النقاط";
    //   request = "طلب استلام ارباح";
    //   txt = " تعدين";
    //   txt4 = 'اكمل التعدين ';
    //   txt1 = "شاهد اعلان واكمل ربح";
    //   watch = 'شاهد الاعلان';
    //   message = 'يجب ان تتعدي نقاطك مليون و 800 الف لطلب ارباح';
    // } else if (widget.lan == 'h') {
    //   minning = 'खुदाई';
    //   scoree = 'अंक';
    //   request = 'लाभ प्राप्त करने का अनुरोध';
    //   txt = 'खुदाई';
    //   txt4 = 'खनन जारी रखें';
    //   txt1 = "एक विज्ञापन देखें और पैसा कमाएं";
    //   watch = 'विज्ञापन देखें';
    //   message =
    //       'पैसे का अनुरोध करने के लिए आपका स्कोर 1 मिलियन और 800 से अधिक या उसके बराबर होना चाहिए';
    // }
    RewardedVideoAd.instance.load(
        adUnitId: 'ca-app-pub-4801644190189400/2473283462'
        //'ca-app-pub-4801644190189400/4424659381',
        //'ca-app-pub-7757590907378676/2778691799',
        //AdmobReward.testAdUnitId,
        // "ca-app-pub-9553580055895935/1690226045",
        ,
        targetingInfo: MobileAdTargetingInfo());

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        print("sss");
        // coins=coins+rewardAmount;
      }
    };
  }

  @override
  void dispose() {
    timeInMinut = 1;
    timer.cancel();
    super.dispose();
  }

  saveData(int s) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('score', s);
    // prefs.setInt('money',m);
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      score = prefs.getInt('score') ?? score;
    });
  }

  savelang(String lang) async {
    prefs = await SharedPreferences.getInstance();
   // prefs.setString('lang', lang);
    // prefs.setInt('money',m);
  }

  getlang() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
    //  widget.lan = prefs.getString('lang') ?? widget.lan;
    });
  }

  _startTimer() {
    percent = 1.0;
    timeInMinut = timeInMinut;
    int Time = timeInMinut * 60;
    double secPercent = (Time / 100);
    timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        if (Time >= 0) {
          Time = Time + 1;
          if (Time % 60 == 0) // a minut has passed
          {
            timeInMinut++;
            // stop = true;
          }

          if (timeInMinut % 300 == 0) {
            stop = true;
            txt = txt1; //'Watch ad then Continue';
            color = Colors.grey;
            color2 = Colors.green;
            money++;
            percent = 0.0;
            timeInMinut = timeInMinut + 1;
            timer.cancel();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner:false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          //height: 1000,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffffe100), Color(0xffdb8b72)],
                begin: FractionalOffset(0.2, 0.7)),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 40),
                    child: Text
                        // ("${getLang(context , "min")}",
                        (
                          "${getLang(context, "minning")}",
                     // minning,
                      // language.Minning(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Text("${getLang(context, "scoree")}" + " = " + score.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)))
                ],
              ),
              Expanded(
                child: CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 200.0,
                    lineWidth: 17.0,
                    progressColor: Colors.white,
                    center: Text(
                      '$timeInMinut',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55.0,
                      ),
                    )),
              ),
              SizedBox(
                height: 2,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  if (score < 2800) {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                              title: new Text(" !!! "),
                              content: new Text(message),
                            ));
                  } else {
                    sendWhatsApp('+9647725256635',
                        'hello i am using minning app =  ' + score.toString());
                  }
                },
                child: Text(
                  "${getLang(context, "request")}",
                //  request,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
              Expanded(
                child: Container(
                  //  height: 1000,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        20.0,
                      ),
                      topLeft: Radius.circular(
                        20.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: RaisedButton(
                              onPressed: () {
                                if (stop == false) {
                                  _startTimer();
                                  stop = true;
                                }
                              },
                              color: color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${getLang(context, "txt")}",
                                 // 'txt',
                               //   txt,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              )),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: RaisedButton(
                              onPressed: () async {
                                if (stop == true) {
                                  videoAd.load(
                                      adUnitId:
                                          'ca-app-pub-3940256099942544/5224354917');

                                  videoAd.show();
                                  RewardedVideoAd.instance.listener =
                                      (RewardedVideoAdEvent event,
                                          {String rewardType,
                                          int rewardAmount}) {
                                    if (event ==
                                        RewardedVideoAdEvent.rewarded) {
                                      setState(() {
                                        videoCompleted = true;
                                        stop = false;
                                        ads = false;
                                        txt = txt4;
                                        //'Watch ad then Continue';
                                        color = Colors.green;
                                        color2 = Colors.grey;
                                        txt = txt;
                                        score = score + 300; //timeInMinut;
                                      });
                                      saveData(score);
                                    }
                                  };
                                }
                              },
                              color: color2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
"${getLang(context, "watch")}",
                               //   'watch',
                                //  watch,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              )),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: RaisedButton(
                              onPressed: () async {
                                if (stop == true) {
                                  await StartApp.showRewardedAd(
                                      onVideoCompleted: () {
                                    setState(() {
                                      videoCompleted = true;
                                      stop = false;
                                      ads = false;
                                      //txt = 'Watch ad then Continue';
                                      color = Colors.green;
                                      color2 = Colors.grey;
                                      txt = txt4;
                                      score = score + 300; //timeInMinut;
                                    });
                                    saveData(score);
                                  }, onReceiveAd: () {
                                    print("recieved".toString());
                                    // ad received callback
                                  }, onFailedToReceiveAd: (String error) {
                                    print(error.toString());
                                    // failed to received ad callback
                                  });
                                }
                              },
                              color: color2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${getLang(context, "watch")}",
                               //   'p',
                                  //watch,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: CurvedNavigationBar(
                    color: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent,
                    //buttonBackgroundColor:Colors.blue,
                    items: <Widget>[
                      Icon(Icons.home, size: 24, color: Colors.black),
                      //   Icon(Icons.add_box,size:24,color:Colors.red),
                      Icon(Icons.ad_units_sharp, size: 24, color: Colors.red),
                   //   Icon(Icons.settings, size: 24, color: Colors.cyan),
                    ],
                    animationCurve: Curves.bounceOut,
                    onTap: (index) async {
                      if (index == 1) {
                        print(widget.lan.toString());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return second(score: score, lang: widget.lan);
                        }));
                      }
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }

  sendWhatsApp(String phone, String msg) async {
    String url() {
      if (Platform.isAndroid) {
        return 'whatsapp://send?phone=$phone&text=$msg';
        // return "https://wa.me/$phone/?text=${Uri.parse(msg)}";
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      } else {
        // return 'whatsapp://send?phone=$phone&text=$msg';
        return "https://wa.me/$phone/?text=${Uri.parse(msg)}";
        //  return 'whatsapp://send?$phone=phone&text=$msg';
        //   return 'whatsapp://wa.me/$phone&text=$msg';
      }
    }

    try {
      await canLaunch(url()) ? launch(url()) : launch(url());
      // : ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('there is no whats app in your device')));
    } catch (e) {
      print("error" + e.toString());
    }
  }
}
