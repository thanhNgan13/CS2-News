// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryClass {
  String name;
  bool isSelected;
  bool isDisplayed;

  CategoryClass({
    required this.name,
    required this.isSelected,
    required this.isDisplayed,
  });

  void setDisplayed(bool isDisplayed) {
    this.isDisplayed = isDisplayed;
  }
}
