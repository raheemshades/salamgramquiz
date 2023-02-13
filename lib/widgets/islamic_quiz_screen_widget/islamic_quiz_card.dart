import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constrants.dart';

class IslamicQuizCard extends StatelessWidget {
  final String title, imageurl;
  final Color col;
  const IslamicQuizCard({
    required this.title,
    required this.col,
    required this.imageurl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: SizedBox(
        height: height(context) * 0.25,
        width: width(context) * 0.35,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: height(context) * 0.13,
                width: width(context) * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: col,
                ),
                child: Center(
                  child: Image.asset(
                    imageurl,
                    width: width(context) * 0.22,
                  ),
                ),
              ),
              gap20,
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 17,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
