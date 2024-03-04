import 'package:flutter/material.dart';

class TempAndSunrise extends StatelessWidget {
  final String img;
  final String heading;
  final String temp;
  const TempAndSunrise({
    super.key,
    required this.img,
    required this.heading,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          img,
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              temp,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}
