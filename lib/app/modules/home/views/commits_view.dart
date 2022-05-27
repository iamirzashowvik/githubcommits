import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubcommit/app/modules/home/controllers/home_controller.dart';

import '../models/commit.dart';
import '../widgets/commits.dart';

class CommitsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF0333333),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 13.0, top: 11.0),
                    child: const Text(
                      'Flutter Commit List',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 17.0),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 13.0, top: 12.0),
                    width: 70.0,
                    height: 22.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: Color(0xF0515050),
                    ),
                    child: const Text(
                      'master',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 17.0),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 11.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => controller.commits.value.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const PageScrollPhysics(),
                        itemCount: controller.commits.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CommitWidget(
                              controller.commits.value[index], controller);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
