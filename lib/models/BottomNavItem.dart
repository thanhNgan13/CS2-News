import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavItem {
  final Icon?
      icon; // Đã thay đổi thành nullable để có thể không cần thiết khi sử dụng constructor khác
  final FaIcon? faIcon; // Tương tự, đặt nullable
  final String label;

  // Constructor mặc định với icon và label
  BottomNavItem({this.icon, required this.label}) : faIcon = null;

  // Named constructor với faIcon và label
  BottomNavItem.fa({this.faIcon, required this.label}) : icon = null;
}
