import 'package:flutter/material.dart';

enum MyButtonEnum { like, comment, share }

enum buttonType {
  favorites,
  readOffline,
  readLate,
  countryLanguage,
  rateUs,
  feedback
}

// Button like, comment, share
class MyButton extends StatefulWidget {
  final icon;
  final String initialText;
  final MyButtonEnum type;
  final VoidCallback onPressed;

  const MyButton(
      {super.key,
      this.icon,
      required this.initialText,
      required this.type,
      required this.onPressed});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  late String text;
  bool isPressLike = false;

  @override
  void initState() {
    super.initState();
    text = widget.initialText;
  }

  // void _onPressed() {
  //   setState(() {
  //     switch (widget.type) {
  //       case MyButtonEnum.like:
  //         if (!isPressLike) {
  //           isPressLike = true;
  //           try {
  //             int like = int.parse(text);
  //             like++;
  //             text = like.toString();
  //           } catch (e) {
  //             text = '1';
  //           }
  //         } else {
  //           isPressLike = false;
  //         }
  //         break;
  //       case MyButtonEnum.comment:
  //         text = '1.2K';
  //         break;
  //       case MyButtonEnum.share:
  //         text = '1.2K';
  //         break;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Xử lý sự kiện khi button được nhấn
        widget.onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(children: [
          Icon(
            widget.icon,
            color: isPressLike ? Colors.red : Colors.white,
            size: 40,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          )
        ]),
      ),
    );
  }
}

// Button favorites, read offline, read late, country language, rate us, feedback
class CustomButton extends StatelessWidget {
  final IconData icon;
  final String initialText;
  final buttonType type;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.icon,
      required this.initialText,
      required this.type,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () {
          // Xử lý sự kiện khi button được nhấn
          onPressed();
        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            initialText,
            style: const TextStyle(color: Colors.black),
          ),
          trailing:
              const Icon(Icons.chevron_right), // Icon mũi tên chỉ sang phải
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  final String urlImage;
  final String text;
  final VoidCallback onPressed;

  const ButtonLogin(
      {super.key,
      required this.urlImage,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 10.0),
      child: OutlinedButton(
        onPressed: () {
          // Xử lý khi nút được nhấn
          onPressed();
        },
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          side: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                urlImage,
                fit: BoxFit.cover,
                height: 30.0,
                width: 30.0,
              ),
              const SizedBox(width: 10), // Khoảng cách giữa hình ảnh và text
              Text(text,
                  style: const TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonInVideosInteract extends StatelessWidget {
  final IconData icon;
  final String initialText;
  final VoidCallback onPressed;

  const ButtonInVideosInteract(
      {super.key,
      required this.icon,
      this.initialText = '',
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(5.0),
        ),
        icon: Icon(
          icon,
          size: 20,
          color: Colors.black,
        ),
        label: Text(initialText,
            style: const TextStyle(fontSize: 15, color: Colors.black)),
        onPressed: onPressed,
      ),
    );
  }
}
