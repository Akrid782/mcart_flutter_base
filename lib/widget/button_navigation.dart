import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget {
  final String title;
  final String nameRoute;

  static const double sizeButton = 48;
  static const double paddingButton = 16.0;
  static const double fontSizeButton = 16.0;

  const ButtonNavigation(this.title, this.nameRoute, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: paddingButton),
      child: SizedBox(
        height: sizeButton,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: fontSizeButton,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.black,
              )
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, nameRoute);
          },
        ),
      ),
    );
  }
}
