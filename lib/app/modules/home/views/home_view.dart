import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubcommit/app/modules/home/views/commits_view.dart';
import 'package:githubcommit/app/modules/home/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (value) {
          controller.pageController.jumpToPage(value);
        },
        selectedItemColor: Color(0xF00A84FF),
        unselectedItemColor: Color(0xDE0A84FF),
        backgroundColor: Color(0xF0161616),
        selectedLabelStyle: TextStyle(
            fontSize: 10.0,
            fontFamily: 'SourceSansPro',
            fontStyle: FontStyle.normal),
        showSelectedLabels: true,
        unselectedLabelStyle: TextStyle(
            fontSize: 10.0,
            fontFamily: 'SourceSansPro',
            fontStyle: FontStyle.normal),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.commit),
            label: 'Commits',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'User Profile'),
        ],
      ),
      body: PageView(
        onPageChanged: (value) {
          controller.selectedIndex.value = value;
        },
        controller: controller.pageController,
        children: <Widget>[CommitsView(), ProfileView()],
      ),
    );
  }
}
