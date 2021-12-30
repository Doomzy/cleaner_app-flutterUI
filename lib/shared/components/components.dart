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

Widget customText(
        {required text,
        fontSize = 24,
        Color = Colors.white,
        letteSpacing = 1,
        fontWeight = FontWeight.normal}) =>
    Text(
      text,
      style: TextStyle(
        color: Color,
        fontSize: fontSize,
        letterSpacing: letteSpacing,
        fontWeight: fontWeight,
      ),
    );
