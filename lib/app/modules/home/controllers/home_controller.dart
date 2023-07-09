import 'dart:async';

import 'package:aigc_wallpaper/app/service/home_api_service.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../model/category_model.dart';

class HomeController extends GetxController {
  final apiService =
      HomeApiService(Dio(BaseOptions(contentType: 'application/json')));
  late CategoryModel cates;
  late List<List<String>> imageUrls;

  @override
  Future<void> onInit() async {
    //网络请求或其他初始化
    cates = await apiService.allCate();
    for (var element in cates.data) {
      print(element.toJson());
    }
    initImgUrls(cates.data.length);
    print(imageUrls.length);
    super.onInit();
  }

  void initImgUrls(int length) async {
    imageUrls = List.generate(length, (index) => []);
    loadImgByCateg(1, 1);
    // update();
  }

  // late List<List<String>> imageUrls = [
  //   [
  //     "https://images.unsplash.com/photo-1682332300122-7cfddb1576c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1680212703757-2565f02a653e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1684254889561-fdd9a84cd8d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1683998994338-a47991333881?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //     "https://images.unsplash.com/photo-1683805988824-7f876592b95b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //   ],
  //   [
  //     "https://images.unsplash.com/photo-1683610970376-fed0f3aac387?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //     "https://images.unsplash.com/photo-1680212703757-2565f02a653e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1684254889561-fdd9a84cd8d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1683998994338-a47991333881?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //     "https://images.unsplash.com/photo-1683805988824-7f876592b95b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //   ],
  //   [
  //     "https://images.unsplash.com/photo-1682332300122-7cfddb1576c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1680212703757-2565f02a653e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1684254889561-fdd9a84cd8d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1683998994338-a47991333881?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //     "https://images.unsplash.com/photo-1683805988824-7f876592b95b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //   ],
  //   [
  //     "https://images.unsplash.com/photo-1682332300122-7cfddb1576c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1680212703757-2565f02a653e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1684254889561-fdd9a84cd8d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  //     "https://images.unsplash.com/photo-1683998994338-a47991333881?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //     "https://images.unsplash.com/photo-1683805988824-7f876592b95b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
  //   ],
  // ];

  final _currentPageIndex = 0.obs; // 当前页码
  final pageController = PageController(initialPage: 0, keepPage: true);
  int get currentPageIndex => _currentPageIndex.value;
  String get currentImageUrl =>
      imageUrls[currentPageIndex][currentHorizontalIndex];
  void setCurrentPageIndex(int index) {
    _currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  final _currentHorizontalIndex = 0.obs;
  int get currentHorizontalIndex => _currentHorizontalIndex.value;
  void setCurrentHorizontalIndex(int index) {
    _currentHorizontalIndex.value = index;
  }

  void loadImgByCateg(int idx, int page) async {
    final productModel = await apiService.productsOfPage();
    if (productModel.code != 0 || productModel.data.list.isEmpty) {
      print(productModel.msg);
      return;
    }
    List<String> imgList = [];
    final productList = productModel.data.list;
    for (var item in productList) {
      imgList.add(item.productInfo.productOriginalUrl);
    }
    imageUrls[idx - 1].addAll(imgList);
    print(imageUrls);
    update();
  }

  void setWallpaper(int wallpaperType, String url) async {
    String result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
        // goToHome: goToHome,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
    if (kDebugMode) {
      print(result);
    }
  }
}
