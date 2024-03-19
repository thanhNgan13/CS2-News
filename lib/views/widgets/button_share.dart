import 'package:flutter/material.dart';

class ButtonShare extends StatelessWidget {
  ButtonShare({
    super.key,
    required this.path,
    required this.title,
  });

  String path;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              height: 60.0,
              width: 60.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
