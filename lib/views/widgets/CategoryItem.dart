import 'package:flutter/material.dart';

import '../../models/Category.dart';

class CategoryItem extends StatelessWidget {
  final CategoryClass category;
  final bool isEditing;
  final Function(int, bool) updateDisplayedCategory;
  final int index;
  final VoidCallback onLongPress;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.isEditing,
    required this.updateDisplayedCategory,
    required this.index,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onLongPress: onLongPress,
          onTap: () {
            if (!category.isDisplayed) updateDisplayedCategory(index, true);
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: (index > 1) ? Colors.white : Colors.grey,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              category.name,
              style: TextStyle(
                color: (index > 1) ? Colors.white : Colors.grey,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if ((!category.isDisplayed || (category.isDisplayed && isEditing)) &&
            index > 1)
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                if (category.isDisplayed) {
                  updateDisplayedCategory(index, false);
                } else {
                  updateDisplayedCategory(index, true);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade700, // You can customize the color
                ),
                child: Icon(
                  category.isDisplayed ? Icons.remove : Icons.add,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
