// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constrants.dart';
import '../../providers/tf_provider.dart';

class ShareTF extends StatelessWidget {
  const ShareTF({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    final trueorfalse = Provider.of<TFProvider>(context);

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent.withRed(12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //this right here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            // height: height(context) * 0.3,
            width: width(context) * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // height: height(context) * 0.07,
                  width: width(context) * 0.75,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Color.fromRGBO(0, 171, 244, 1),
                        Color.fromRGBO(0, 161, 233, 1),
                        Color.fromRGBO(1, 104, 171, 1),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Share the question",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: height(context) * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: width(context) * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: height(context) * 0.03,
                        ),
                      ),
                      SizedBox(
                        width: width(context) * 0.04,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                Text(
                  trueorfalse.truefalse[index].question,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: height(context) * 0.02,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.005,
                ),
                Text(
                  "TRUE",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: height(context) * 0.02,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.005,
                ),
                Text(
                  "FALSE",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: height(context) * 0.02,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height(context) * 0.03,
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
                    "Share",
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
    );
  }
}
