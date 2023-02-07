import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salamgramquiz/screens/finish.dart';
import 'package:salamgramquiz/widgets/islamic_quiz_screen_widget/Share_Question_dailog.dart';

import '../constrants.dart';
import '../providers/multiplechoice.dart';

class Multiplechoice extends StatefulWidget {
  const Multiplechoice({
    Key? key,
  }) : super(key: key);

  @override
  State<Multiplechoice> createState() => _MultiplechoiceState();
}

class _MultiplechoiceState extends State<Multiplechoice> {
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider(create: (_) => MultipleChoiceprovider());
    final multiprovider = Provider.of<MultipleChoiceprovider>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(9, 167, 255, 1),
          body: Container(
            color: const Color.fromARGB(255, 234, 234, 234),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: const Color.fromRGBO(9, 167, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              // Navigator.pop(context);
                              // multiprovider.setcount(1);
                              multiprovider.decreament();
                              if (multiprovider.count < 1) {
                                Navigator.pop(context);
                                multiprovider.increment();
                              }
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 22,
                            )),
                        SizedBox(width: width(context) * 0.2),
                        const Text(
                          "Islamic Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
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
                            "${multiprovider.count}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: height(context) * 0.04,
                              color: Colors.black,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.04,
                        ),
                        Text(
                          multiprovider
                              .multiplechoice[multiprovider.count - 1].question,
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
                  height: height(context) * 0.02,
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: multiprovider
                            .multiplechoice[multiprovider.count - 1]
                            .options!
                            .length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(
                              multiprovider
                                  .multiplechoice[multiprovider.count - 1]
                                  .options![index],
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: height(context) * 0.02,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            leading: Radio(
                              // activeColor: Colors.amber,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(0, 168, 241, 1)),
                              value: multiprovider
                                  .multiplechoice[multiprovider.count - 1]
                                  .options![index],
                              groupValue: multiprovider.chosenvalue,
                              onChanged: (value) {
                                multiprovider.chosenvalue = value.toString();
                                setState(() {});
                              },
                            ),
                          );
                        })),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.06,
                  width: width(context) * 0.85,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: multiprovider.multiplechoice.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          height: height(context) * 0.06,
                          width: width(context) * 0.16,
                          decoration: BoxDecoration(
                              color: multiprovider.count.toString() ==
                                      (index + 1).toString()
                                  ? const Color.fromRGBO(0, 168, 241, 1)
                                  : const Color.fromRGBO(196, 196, 196, 1),
                              shape: BoxShape.circle),
                          child: Text(
                            (index + 1).toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: height(context) * 0.04,
                              color: Colors.black,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        );
                      })),
                ),
                SizedBox(
                  height: height(context) * 0.04,
                ),
                InkWell(
                  onTap: () {
                    multiprovider.answers.addAll({
                      multiprovider.multiplechoice[multiprovider.count - 1].id:
                          multiprovider.chosenvalue
                    });
                    if (multiprovider.count.toString() !=
                        multiprovider.questionlenght.toString()) {
                      multiprovider.increment();
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Finish(
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
                        multiprovider.count.toString() !=
                                multiprovider.questionlenght.toString()
                            ? "Next"
                            : "Finish",
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
                        builder: (BuildContext context) =>
                            const Sharequestiondailog());
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
                          "Share Questions",
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
          )),
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
