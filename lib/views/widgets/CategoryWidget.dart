import 'package:flutter/material.dart';
import 'package:cs2_news/models/Category.dart';

class CategoryWidget extends StatelessWidget {
  CategoryClass category;
  final onTap;

  CategoryWidget({
    Key? key,
    required this.onTap,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(
              category.name,
              style: TextStyle(
                fontSize: category.isSelected ? 22 : 16,
                fontWeight: FontWeight.w500,
                color: category.isSelected ? Colors.white : Colors.grey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (category.isSelected)
              Container(
                width: 35,
                height: 4,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(5),
                      topEnd: Radius.circular(5),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
