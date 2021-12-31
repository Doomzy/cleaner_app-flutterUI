import 'package:flutter/material.dart';

void navigateTo({required context, required Widget destination}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );

void navigateToAndRemove({required context, required Widget destination}) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination),
        (Route<dynamic> route) => false);

Widget customText({
  required text,
  double fontSize = 24,
  Color = Colors.white,
  double? letteSpacing,
  fontWeight = FontWeight.normal,
}) =>
    Text(
      text,
      style: TextStyle(
        color: Color,
        fontSize: fontSize,
        letterSpacing: letteSpacing,
        fontWeight: fontWeight,
      ),
    );

Widget circularProgressBar({
  required double size,
  required double value,
  required color,
  required double strokWidth,
}) =>
    SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
        value: value,
        color: color,
        strokeWidth: strokWidth,
      ),
    );

Widget statusInfo({
  required double percentage,
  required label,
  required color,
  required uStats,
  required aStats,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            customText(
              text: '$percentage',
              fontWeight: FontWeight.bold,
            ),
            customText(text: ' %', fontSize: 15),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
              ),
              width: 16,
              height: 16,
            ),
            SizedBox(width: 10),
            customText(
              text: label,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 10),
        customText(
          text: '$uStats/$aStats GB',
          fontSize: 8,
          Color: Color.fromRGBO(255, 255, 255, 0.5),
        )
      ],
    );

Widget cleanerOpsBtn({
  required icon,
  required title,
}) =>
    Container(
      width: 120,
      height: 115,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
      ),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsetsDirectional.only(top: 10),
      child: MaterialButton(
        onPressed: () {},
        padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        child: Column(
          children: [
            Image(image: AssetImage(icon)),
            Spacer(),
            customText(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              Color: const Color.fromRGBO(255, 255, 255, 0.5),
            ),
          ],
        ),
      ),
    );
