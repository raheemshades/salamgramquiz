// ignore_for_file: file_names

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:salamgramquiz/screens/islamic_quiz.dart';
import '../constrants.dart';
import '../providers/multiplechoice.dart';
import '../providers/TF_Provider.dart';
import '../widgets/islamic_quiz_screen_widget/Score_Share_dailog.dart';
import '../widgets/islamic_quiz_screen_widget/custom_appbar.dart';

class Scorepage extends StatelessWidget {
  final String route;
  const Scorepage({
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final truefalse = Provider.of<TFProvider>(context);
    final multiple = Provider.of<MultipleChoiceprovider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 234, 234),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 234, 234, 234),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomAppbar(
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
                        SizedBox(
                          height: height(context) * 0.06,
                          width: width(context) * 0.85,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: route == "truefalse"
                                  ? truefalse.questionlenght
                                  : multiple.multiplechoice.length,
                              itemBuilder: ((context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: height(context) * 0.06,
                                      width: width(context) * 0.16,
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(0, 168, 241, 1),
                                          shape: BoxShape.circle),
                                      child: Column(
                                        children: [
                                          Text(
                                            (index + 1).toString(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: height(context) * 0.04,
                                              color: Colors.white,
                                              // fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                          height: height(context) * 0.04,
                                          width: width(context) * 0.05,
                                          decoration: BoxDecoration(
                                              color: route == "truefalse"
                                                  ? truefalse.trueansindex[
                                                              index] ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red
                                                  : multiple.trueansindex[
                                                              index] ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red,
                                              shape: BoxShape.circle),
                                          child: route == "truefalse"
                                              ? truefalse.trueansindex[index] ==
                                                      true
                                                  ? Icon(
                                                      Icons.check,
                                                      size: height(context) *
                                                          0.02,
                                                    )
                                                  : Icon(
                                                      Icons.close,
                                                      size: height(context) *
                                                          0.02,
                                                    )
                                              : multiple.trueansindex[index] ==
                                                      true
                                                  ? Icon(
                                                      Icons.check,
                                                      size: height(context) *
                                                          0.02,
                                                    )
                                                  : Icon(
                                                      Icons.close,
                                                      size: height(context) *
                                                          0.02,
                                                    )),
                                    ),
                                  ],
                                );
                              })),
                        ),
                        SizedBox(
                          height: height(context) * 0.04,
                        ),
                        Text(
                          "You just finished the questions",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: height(context) * 0.02,
                            color: Colors.black,
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
                  height: height(context) * 0.03,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context) * 0.35,
                    width: width(context) * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromRGBO(0, 168, 241, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height(context) * 0.03,
                        ),
                        Text(
                          "Score",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: height(context) * 0.032,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height(context) * 0.06,
                        ),
                        Text(
                          route == "truefalse"
                              ? "${(truefalse.score!).toDouble().toStringAsFixed(2)}%"
                              : "${(multiple.score!).toDouble().toStringAsFixed(2)}%",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: height(context) * 0.07,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: height(context) * 0.03,
                        ),
                        Text(
                          "Alhamduillah",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: height(context) * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.04,
                ),
                InkWell(
                  onTap: () {
                    multiple.answers.clear();
                    multiple.setcount(1);
                    truefalse.answers.clear();
                    truefalse.setcount(1);

                    Navigator.pop(context, (route) => true);
                    Navigator.pop(context, (route) => true);
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
                        "Try Again",
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
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const IslamicQuiz()),
                        (Route<dynamic> route) => false);
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
                        "GoTo Main Page",
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
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => ScoreDailog(
                              score: route == "truefalse"
                                  ? "${(truefalse.score!).toDouble().toStringAsFixed(2)}%"
                                  : "${(multiple.score!).toDouble().toStringAsFixed(2)}%",
                            ));
                  },
                  child: Container(
                    height: height(context) * 0.07,
                    width: width(context) * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        // stops: [0.1, 0.5, 0.7, 0.9],
                        colors: [
                          Color.fromRGBO(0, 171, 244, 1),
                          Color.fromRGBO(0, 161, 233, 1),
                          Color.fromRGBO(1, 104, 171, 1),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width(context) * 0.06,
                        ),
                        const Icon(Icons.share),
                        SizedBox(
                          width: width(context) * 0.01,
                        ),
                        Text(
                          "Share Score",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: height(context) * 0.025,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: width(context) * 0.06,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
