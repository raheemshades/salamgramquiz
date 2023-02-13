import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salamgramquiz/screens/multiple_choice.dart';
import 'package:salamgramquiz/screens/true_false.dart';

import '../constrants.dart';
import '../providers/TF_Provider.dart';
import '../providers/multiplechoice.dart';
import '../widgets/islamic_quiz_screen_widget/islamic_quiz_card.dart';

class IslamicQuiz extends StatelessWidget {
  const IslamicQuiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final multiprovider = Provider.of<MultipleChoiceprovider>(context);
    final truefalse = Provider.of<TFProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(9, 167, 255, 1),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              // stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color.fromRGBO(9, 167, 255, 1),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              gap10,
              const Text(
                "Islamic Quiz",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: height(context) * 0.85,
                  width: width(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height(context) * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              multiprovider.fetchdata().then((value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MultiplechoiceScreen()),
                                );
                              });
                            },
                            child: const IslamicQuizCard(
                                title: "Multiple Choice",
                                col: Color.fromRGBO(255, 245, 0, 1),
                                imageurl: "assets/multiplechoice.png"),
                          ),
                          const IslamicQuizCard(
                              title: "Basic of Islam",
                              col: Color.fromRGBO(67, 186, 86, 1),
                              imageurl: "assets/basicofislam.png"),
                        ],
                      ),
                      gap20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              truefalse.fetchdata().then((value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TrueorFalse()),
                                );
                              });
                            },
                            child: const IslamicQuizCard(
                                title: "True or False Question",
                                col: Color.fromRGBO(67, 122, 186, 1),
                                imageurl: "assets/trueorfalse.png"),
                          ),
                          const IslamicQuizCard(
                              title: "Islamic History",
                              col: Color.fromRGBO(67, 186, 172, 1),
                              imageurl: "assets/islamichistory.png"),
                        ],
                      ),
                      SizedBox(
                        height: height(context) * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/close.png",
                          height: height(context) * 0.055,
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
