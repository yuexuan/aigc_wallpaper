import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class PageViewWidget2 extends GetView<HomeController> {
  const PageViewWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = controller.pageController;
    return PageView.builder(
      controller: pageController,
      scrollDirection: Axis.vertical,
      itemCount: 100,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 16,
              controller: PageController(
                  initialPage: controller.currentHorizontalIndex),
              onPageChanged: (newIndex) {
                controller.setCurrentHorizontalIndex(newIndex);
              },
              itemBuilder: (context, horizontalIndex) {
                return Container(
                  color: Colors.accents[
                      (index * 3 + horizontalIndex) % Colors.accents.length],
                  child: Center(
                    child: Text(
                      'Page ${index + 1}-${horizontalIndex + 1}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
