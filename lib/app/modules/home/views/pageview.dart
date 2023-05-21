import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class PageViewWidget extends GetView<HomeController> {
  const PageViewWidget({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // 获取屏幕高度
    final PageController pageController = controller.pageController;

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          final imageUrls = controller.imageUrls;

          if (imageUrls.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // return MediaQuery.removePadding(
          //     context: context,
          //     removeTop: true,
          //     removeBottom: true,
          //     child: SizedBox(
          //       height: screenHeight, // 将容器的高度设置为屏幕高度
          //       child: PageView.builder(
          //         itemCount: imageUrls.length,
          //         onPageChanged: (int index) {
          //           controller.setCurrentPageIndex(index);
          //         },
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //               color: Colors.blueGrey,
          //               child: GestureDetector(
          //                 // onTap: () =>
          //                 //     controller.setWallpaper(1, imageUrls[index]),
          //                 // onTap: () => _showImageOptionsDialog(context),
          //                 onLongPress: () => _showImageOptionsDialog(context),
          //                 child: CachedNetworkImage(
          //                   imageUrl: imageUrls[index],
          //                   fit: BoxFit.fill,
          //                   placeholder: (context, url) => const Center(
          //                       child: CircularProgressIndicator()),
          //                   errorWidget: (context, url, error) =>
          //                       const Center(child: Icon(Icons.error)),
          //                 ),
          //               ));
          //         },
          //       ),
          //     )
          //   );
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
                          color: Colors.accents[(index * 3 + horizontalIndex) %
                              Colors.accents.length],
                          // child: Center(
                          //   child: Text(
                          //     'Page ${index + 1}-${horizontalIndex + 1}',
                          //     style: const TextStyle(
                          //       fontSize: 32,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          child: GestureDetector(
                            // onTap: () =>
                            //     controller.setWallpaper(1, imageUrls[index]),
                            // onTap: () => _showImageOptionsDialog(context),
                            onLongPress: () => _showImageOptionsDialog(context),
                            child: CachedNetworkImage(
                              imageUrl: imageUrls[index][horizontalIndex],
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
                            ),
                          ));
                    },
                  ),
                ),
              );
            },
          );
        });
  }

  void _showImageOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('请选择设置壁纸的类型'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 设置桌面壁纸
              TextButton(
                child: const Text('设为桌面壁纸', textAlign: TextAlign.left),
                onPressed: () async {
                  Navigator.pop(context);
                  controller.setWallpaper(1, controller.currentImageUrl);
                },
              ),

              // 设置锁屏壁纸
              TextButton(
                child: const Text('设为锁屏壁纸', textAlign: TextAlign.left),
                onPressed: () async {
                  Navigator.pop(context);
                  controller.setWallpaper(2, controller.currentImageUrl);
                },
              ),

              // 都设置
              TextButton(
                child: const Text('同时设为桌面和锁屏壁纸', textAlign: TextAlign.left),
                onPressed: () async {
                  Navigator.pop(context);
                  controller.setWallpaper(3, controller.currentImageUrl);
                },
              ),

              // 取消
              TextButton(
                child: const Text('取消', textAlign: TextAlign.left),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      },
    );
  }
}
