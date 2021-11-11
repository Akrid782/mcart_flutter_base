import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget {
  final String title;
  final String nameRoute;

  final double sizeButton = 50;

  const ButtonNavigation(this.title, this.nameRoute, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        height: sizeButton,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
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
