import 'package:flutter/material.dart';
import 'package:cs2_news/models/Category.dart';

import '../widgets/CategoryItem.dart';

class OptionNews extends StatefulWidget {
  const OptionNews({
    super.key,
    required this.listCategoriesClass,
    required this.updateDisplayedCategory,
  });

  final List<CategoryClass> listCategoriesClass;
  final Function(int, bool) updateDisplayedCategory;

  @override
  State<OptionNews> createState() => _OptionNewsState();
}

class _OptionNewsState extends State<OptionNews> {
  bool isEditing = false;

  void _updateDisplayedCategory(int index, bool isDisplayed) {
    setState(() {
      widget.listCategoriesClass[index].isDisplayed = isDisplayed;
      widget.updateDisplayedCategory(index, isDisplayed);
    });
  }

  void _updateEditing() {
    setState(() {
      isEditing ? isEditing = false : isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'News Options',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.grey,
          size: 25,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.black,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Country & language',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0), // Đặt giá trị radius là 0
                            ),
                            child: Container(
                              height: 520,
                              padding: const EdgeInsets.all(8),
                              color: Colors.black,
                              child: Column(
                                children: [
                                  const Text(
                                    'Country & Language',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                    child: ListView(
                                      children: const [
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                        Item(),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: const Item(),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
              color: const Color.fromARGB(255, 19, 23, 25),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My channels',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              isEditing
                                  ? 'Drag to reorder categories'
                                  : 'Long press to edit',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        OutlinedButton(
                          onPressed: _updateEditing,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            minimumSize: const Size(100, 27),
                          ),
                          child: Text(
                            isEditing ? 'Complete' : 'Edit',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (int index = 0;
                            index < widget.listCategoriesClass.length;
                            index++)
                          if (widget.listCategoriesClass[index].isDisplayed)
                            CategoryItem(
                              category: widget.listCategoriesClass[index],
                              isEditing: isEditing,
                              updateDisplayedCategory: _updateDisplayedCategory,
                              index: index,
                              onLongPress: _updateEditing,
                            )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommend using',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Click to add',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (int index = 0;
                            index < widget.listCategoriesClass.length;
                            index++)
                          if (!widget.listCategoriesClass[index].isDisplayed)
                            CategoryItem(
                              category: widget.listCategoriesClass[index],
                              isEditing: isEditing,
                              updateDisplayedCategory: _updateDisplayedCategory,
                              index: index,
                              onLongPress: _updateEditing,
                            )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 30,
          color: Colors.red,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            'Viet Nam',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.red,
          size: 35,
        ),
      ],
    );
  }
}
