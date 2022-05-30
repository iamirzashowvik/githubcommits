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

  var isLoading = true.obs;
  var commits = Rx<List<CommitList>>([]);
  int page = 0;
  getCommits() async {
    var _commitResponse = Rx<List<CommitList>>([]);
    var response =
        await hitApiX.getResponse(AppStrings.commitUrl + "?page=$page");
    final commitList = commitListFromJson(response.body);

    for (var i = 0; i < commitList.length; i++) {
      if (!(commitList[i].author.login.toString().toLowerCase().contains('g') ||
          commitList[i].author.login.toString().toLowerCase().contains('x'))) {
        _commitResponse.value.add(commitList[i]);
        //   log(i.toString());
      }
    }
    commits.value = _commitResponse.value;
    if (commits.value.length < 10) {
      page++;
      getCommits();
    } else {
      isLoading.value = false;
    }
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
