import 'package:flutter/material.dart';

class InterstitialAdProvider with ChangeNotifier {
  var _count = 0;
  bool _isLoading = false;

  get count => _count;
  bool get isLoading => _isLoading;

  Future<void> checkMoveTab() async {
    _count++;
    print('count: $_count');
    if (_count >= 3) {
      _isLoading = true;
      notifyListeners();
    }
  }

  Future<void> reset() async {
    _count = 0;
    _isLoading = false;
    notifyListeners();
  }
}
