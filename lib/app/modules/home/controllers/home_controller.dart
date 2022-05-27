import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubcommit/app/data/appstrings.dart';
import 'package:githubcommit/app/service/apicalls.dart';
import 'package:githubcommit/app/service/logging.dart';

import '../models/commit.dart';
import '../models/user.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCommits();
  }

  var commits = Rx<List<CommitList>>([]);
  getCommits() async {
    var response = await hitApiX.getResponse(AppStrings.commitUrl);
    final commitList = commitListFromJson(response.body);
    commits.value = commitList;
  }

  var user = User().obs;
  getUserProfile(var url) async {
    var response = await hitApiX.getResponse(url);
    user.value = userFromJson(response.body);
  }

  var userName = 'GithubUsername'.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  var selectedIndex = 0.obs;
  final PageController pageController = PageController();
  void onTappedBar(int value) {
    selectedIndex.value = value;
    pageController.jumpToPage(value);
  }
}
