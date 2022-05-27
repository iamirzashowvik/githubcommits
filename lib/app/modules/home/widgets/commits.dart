import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';
import '../models/commit.dart';

class CommitWidget extends StatelessWidget {
  CommitList commitList;
  HomeController controller;
  CommitWidget(this.commitList, this.controller);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.pageController.jumpToPage(1);
        controller.getUserProfile(commitList.author.url);
        controller.userName.value = commitList.commit.author.name;
      },
      child: Column(
        children: [
          Container(
            width: 375.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * .70,
                  margin: EdgeInsets.only(top: 12.0),
                  child: Text(
                    commitList.commit.message,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'SourceSansPro',
                        fontSize: 17.0),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 14.0, right: 17.0),
                  //width: 36.0,
                  height: 15.0,
                  color: Color(0xF0515050),
                  child: Text(
                    getTime(commitList.commit.author.date),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xF0B8B8B8),
                        fontFamily: 'SourceSansPro',
                        fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0, bottom: 12.0),
            child: Row(
              children: [
                Container(
                  height: 20.0,
                  width: 20.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(commitList.author.avatarUrl),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  child: Text(commitList.author.login,
                      style: TextStyle(
                          color: Color(0xF09B9B9B),
                          fontSize: 12.0,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

getTime(time) {
  var date = DateTime.parse(time);
  var formatter = new DateFormat('dd/MM/yyyy');
  print(formatter.format(date));
  var today = DateTime.now().difference(date).inDays;
  print(today);
  if (today == 0) {
    return date.hour.toString() + ":" + date.minute.toString();
  }
  if (today > 0 && today < 7) {
    if (today == 1) {
      return 'yesterday';
    }
    return today.toString() + ' days ago';
  }

  return formatter.format(date);
}
