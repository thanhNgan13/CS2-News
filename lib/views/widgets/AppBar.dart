// app_bar.dart
import 'package:flutter/material.dart';
import 'package:cs2_news/models/Category.dart';
import '../pages/option_news.dart';
import '../pages/searchScreen.dart';
import 'CategoryWidget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(110.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final ScrollController _scrollController = ScrollController();
  final scrollOffset = 50;

  List<CategoryClass> categories = [
    CategoryClass(name: 'Follow', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'For you', isSelected: true, isDisplayed: true),
    CategoryClass(name: 'AWW', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'News', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'Comedy', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'Entertainment', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'Emotion', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'Sports', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'Tech', isSelected: false, isDisplayed: true),
    CategoryClass(name: 'Car', isSelected: false, isDisplayed: true),
  ];

  int SelectedCategory = 1;
  void _updateSelectedCategory(int index) {
    if (index != SelectedCategory) {
      setState(() {
        categories[index].isSelected = true;
        categories[SelectedCategory].isSelected = false;
        SelectedCategory = index;
      });
    }
  }

  void _updateDisplayedCategory(int index, bool isDisplayed) {
    setState(() {
      categories[index].isDisplayed = isDisplayed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Row 1
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Logo
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/opera-news-logo.png',
                    fit: BoxFit.cover,
                    height: 40.0,
                    width: 40.0,
                  ),
                ), //Button Modal
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Set Your City',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.red,
                        size: 30,
                      )
                    ],
                  ),
                ),
                //Button Search
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Row 2
          Row(
            //Categories
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int index = 0; index < categories.length; index++)
                        if (categories[index].isDisplayed)
                          CategoryWidget(
                            onTap: () {
                              _updateSelectedCategory(index);
                              // Lấy chỉ số của danh mục được chọn
                              int selectedIndex = index;

                              // Tính toán khoảng cách cần di chuyển (có thể điều chỉnh giá trị này)
                              double scrollOffset = selectedIndex * 50;

                              // Di chuyển ScrollView sang trái
                              _scrollController.animateTo(
                                scrollOffset,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            category: categories[index],
                          )
                    ],
                  ),
                ),
              ),
              //Option News
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OptionNews(
                        listCategoriesClass: categories,
                        updateDisplayedCategory: _updateDisplayedCategory,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.format_list_bulleted,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(116.0);
}
