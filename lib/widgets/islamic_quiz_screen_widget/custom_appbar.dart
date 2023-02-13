import 'package:flutter/material.dart';

import '../../constrants.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  const CustomAppbar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(9, 167, 255, 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 22,
                )),
            SizedBox(width: width(context) * 0.2),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
