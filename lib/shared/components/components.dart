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

Widget toolboxOptions({
  required header,
  required info,
  required icon,
  required context,
  required screen,
}) =>
    InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () => navigateTo(context: context, destination: screen),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(icon),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(text: header, fontSize: 14),
              SizedBox(height: 10),
              customText(
                text: info,
                fontSize: 14,
                fontWeight: FontWeight.w100,
                Color: Colors.white30,
              ),
            ],
          )
        ],
      ),
    );

Widget appsUninstallCtrl(
  icon, {
  required name,
  required VoidCallback uninstall,
}) =>
    Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(icon ?? 'assets/icons/apps.png'),
          ),
          Spacer(),
          customText(text: name, fontSize: 16),
          Spacer(),
          MaterialButton(
            onPressed: uninstall,
            child: customText(text: 'Uninstall', fontSize: 16),
            padding: EdgeInsetsDirectional.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Color.fromRGBO(255, 255, 255, 0.1),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 15,
            backgroundColor: Color.fromRGBO(74, 186, 242, 1),
            child: customText(text: 'i', fontSize: 18),
          )
        ],
      ),
    );

Widget appListHeader(
        {required title,
        required VoidCallback toggleList,
        required bool isOpened,
        required numOfApps}) =>
    InkWell(
      onTap: toggleList,
      splashFactory: NoSplash.splashFactory,
      child: Row(
        children: [
          customText(text: title, fontSize: 16),
          Spacer(),
          Icon(
            isOpened ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 20),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.1),
              borderRadius: BorderRadiusDirectional.all(
                Radius.circular(10),
              ),
            ),
            padding: const EdgeInsetsDirectional.all(10),
            child: customText(text: '$numOfApps', fontSize: 16),
          ),
        ],
      ),
    );

Widget appToggleWidget(
  icon, {
  required name,
  required Function(bool)? toggle,
  required bool isEnabled,
}) =>
    Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(icon ?? 'assets/icons/apps.png'),
        ),
        SizedBox(width: 50),
        customText(text: name, fontSize: 16),
        Spacer(),
        Switch(
          value: isEnabled,
          inactiveTrackColor: Color.fromRGBO(185, 185, 185, 1),
          inactiveThumbColor: Colors.grey,
          activeColor: Color.fromRGBO(162, 230, 46, 1),
          activeTrackColor: Color.fromRGBO(185, 185, 185, 1),
          onChanged: toggle,
        )
      ],
    );
