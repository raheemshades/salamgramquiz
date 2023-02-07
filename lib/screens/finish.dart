import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salamgramquiz/providers/multiplechoice.dart';
import 'package:salamgramquiz/screens/Score.dart';

import '../constrants.dart';
import '../providers/truefalseprovider.dart';
import '../widgets/islamic_quiz_screen_widget/custom_appbar.dart';

class Finish extends StatelessWidget {
  String route;
  Finish({
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final truefalse = Provider.of<truefalseprovider>(context);
    final multiple = Provider.of<MultipleChoiceprovider>(context);

    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(9, 167, 255, 1),
          body: Container(
            color: const Color.fromARGB(255, 234, 234, 234),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customappbar(
                  title: "Islamic Quiz",
                ),
                Container(
                  // height: height(context) * 0.30,
                  width: width(context) * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height(context) * 0.04,
                        ),
                        Container(
                          height: height(context) * 0.06,
                          width: width(context) * 0.23,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(0, 168, 241, 1),
                              shape: BoxShape.circle),
                          child: Text(
                            "?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: height(context) * 0.04,
                              color: Colors.white,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.04,
                        ),
                        Text(
                          "Are you sure with all the answer ? if no, you can check again ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: height(context) * 0.02,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.05,
                ),
                InkWell(
                  onTap: () {
                    int count = 0;

                    if (route == "trueorfalse") {
                      for (int i = 0; i < truefalse.answers.length; i++) {
                        if (truefalse.truefalse[i].answer.toString() ==
                            truefalse.answers[truefalse.truefalse[i].id]
                                .toString()) {
                          count++;
                        }
                      }

                      truefalse
                          .setscore((count * 100) / truefalse.questionlenght);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Score(
                                  route: "truefalse",
                                )),
                      );
                    } else if (route == "multiple") {
                      for (int i = 0; i < multiple.multiplechoice.length; i++) {
                        if (multiple.multiplechoice[i].rightanswer.toString() ==
                            multiple.answers[multiple.multiplechoice[i].id]
                                .toString()) {
                          count++;
                        }
                      }

                      multiple.setscore(
                          (count * 100) / multiple.multiplechoice.length);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Score(
                                  route: "multiple",
                                )),
                      );
                    }
                  },
                  child: Container(
                    height: height(context) * 0.07,
                    width: width(context) * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(0, 171, 244, 1),
                          Color.fromRGBO(0, 161, 233, 1),
                          Color.fromRGBO(1, 104, 171, 1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "InshaAllah",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: height(context) * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context) * 0.07,
                    width: width(context) * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(0, 171, 244, 1),
                          Color.fromRGBO(0, 161, 233, 1),
                          Color.fromRGBO(1, 104, 171, 1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "No",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: height(context) * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomsheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      barrierColor: Colors.grey.withOpacity(0.7),
      backgroundColor: Colors.grey.withOpacity(0.7),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        return Container(
          height: height * 0.9,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 2,
                child: SizedBox(
                  // height: height * 0.25,
                  width: width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("assets/boy.png"),
                              ),
                            ),
                            Text(
                              "Me",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height * 0.055,
                              width: width * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Type duas..."),
                              ),
                            ),
                            const Icon(
                              Icons.send,
                              size: 35,
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.45,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/close.png",
                  height: 60,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
