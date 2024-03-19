import 'package:flutter/material.dart';

class OutLineButtonCustom extends StatelessWidget {
  OutLineButtonCustom({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  Icon icon;
  String title;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(60, 60)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
            ),
            child: icon),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
