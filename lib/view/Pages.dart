import 'package:flutter/material.dart';
import 'package:jaa_taa/commonComponet/AppColors.dart';
import 'package:jaa_taa/view/AddPostScreen.dart';
import 'package:jaa_taa/view/AdsScreen.dart';
import 'package:jaa_taa/view/ChatScreen.dart';
import 'package:jaa_taa/view/HomeScreen.dart';
import 'package:jaa_taa/view/ProfileScreen.dart';

class PagesScreen extends StatefulWidget {
  @override
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomeScreen(),
    ChatScreen(),
    AddPostScreen(),
    AdsScreen(),
    ProfileScreen()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedItem) {
    print(selectedItem);
    _pageController.jumpToPage(selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     //Get.to(AddAssignment(courseId));
      //   },
      //   splashColor: AppColors.themeColor,
      //   child:Icon(Icons.add),
      //   // shape: RoundedRectangleBorder(
      //   //     borderRadius: BorderRadius.all(Radius.circular(30.0)))
      //
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.themeColorLight,
        selectedFontSize: 16,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,
                color: _selectedIndex == 0 ? Colors.white : Colors.blueGrey),
            title: Text(
              'Home',
              style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.white : Colors.blueGrey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,
                color: _selectedIndex == 1 ? Colors.white : Colors.blueGrey),
            title: Text(
              'Chat',
              style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.white : Colors.blueGrey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, color: Colors.red, size: 30),
            title: Text(
              'Add post',
              style: TextStyle(
                  color: _selectedIndex == 2 ? Colors.white : Colors.blueGrey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt,
                color: _selectedIndex == 3 ? Colors.white : Colors.blueGrey),
            title: Text(
              'Ads',
              style: TextStyle(
                  color: _selectedIndex == 3 ? Colors.white : Colors.blueGrey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box,
                color: _selectedIndex == 4 ? Colors.white : Colors.blueGrey),
            title: Text(
              'Account',
              style: TextStyle(
                  color: _selectedIndex == 4 ? Colors.white : Colors.blueGrey),
            ),
          ),
        ],
      ),
    );
  }
}
