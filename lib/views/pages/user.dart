import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:cs2_news/views/admin/adminpage.dart';
import '../widgets/CustomButton.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with WidgetsBindingObserver {
  bool isBottomSheetOpen = false;
  bool isLogged = false;
  String userImage = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.portrait &&
        isBottomSheetOpen) {
      Navigator.of(context).pop(); // Đóng chỉ khi bottom sheet đang mở
      isBottomSheetOpen = false; // Cập nhật trạng thái
    }
  }

  // Show dialog box
  displayDialogBox() {
    // Kiểm tra xem định hướng hiện tại có phải là ngang hay không
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      // Nếu thiết bị đang ở chế độ ngang, không hiển thị bottom sheet
      return;
    } else {
      isBottomSheetOpen = true; // Đánh dấu bottom sheet đang mở
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: Column(
              children: [
                // logo
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red, // Màu của đường viền
                        width: 3.0, // Độ dày của đường viền
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/opera-news-logo.png',
                        fit: BoxFit.cover,
                        height: 60.0,
                        width: 60.0,
                      ),
                    ),
                  ),
                ),

                // content
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Opera News',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // button
                ButtonLogin(
                    urlImage: 'assets/images/google-logo.png',
                    text: 'Sign in with Google',
                    onPressed: () {}),
                ButtonLogin(
                    urlImage: 'assets/images/facebook-logo.png',
                    text: 'Sign in with Facebook',
                    onPressed: () {}),
                ButtonLogin(
                    urlImage: 'assets/images/twitter-logo.png',
                    text: 'Sign in with Twitter',
                    onPressed: () {}),
              ],
            ),
          );
        },
      ).whenComplete(() {
        isBottomSheetOpen = false; // Đánh dấu bottom sheet đã đóng
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Opera News',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isLogged ? widgetLogged() : widgetLogin(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    icon: Icons.bookmark_border,
                    initialText: 'Favorites',
                    type: buttonType.favorites,
                    onPressed: () {
                      // Xử lý khi nút được nhấn
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    icon: Icons.get_app_outlined,
                    initialText: 'Read offline',
                    type: buttonType.readOffline,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    icon: Icons.history,
                    initialText: 'Read late',
                    type: buttonType.readLate,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    icon: Icons.language,
                    initialText: 'Country & Language',
                    type: buttonType.countryLanguage,
                    onPressed: () {
                      showCountryPicker(
                          context: context,
                          showPhoneCode: false,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight:
                                500, // Optional. Country list modal height
                            //Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          onSelect: (Country country) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Đã chọn ${country.name}'),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    icon: Icons.star_outline,
                    initialText: 'Rate us',
                    type: buttonType.rateUs,
                    onPressed: () {
                      // Xử lý khi nút được nhấn
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    icon: Icons.mode_comment_outlined,
                    initialText: 'Feedback',
                    type: buttonType.feedback,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding widgetLogin() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              foregroundColor: Colors.white,
              backgroundColor:
                  const Color.fromARGB(255, 216, 65, 18), // foreground
            ),
            onPressed: () {
              displayDialogBox();
            },
            child: const Text('Login',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          )
        ],
      ),
    );
  }

  Column widgetLogged() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // create image avatar
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red, // Màu của đường viền
                    width: 3.0, // Độ dày của đường viền
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    userImage,
                    fit: BoxFit.cover,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              // create text
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 10.0,
          width: double.infinity,
          color: Colors.black,
        ),
      ],
    );
  }
}
