import 'package:aigc_wallpaper/app/modules/home/views/pageview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewWidget(key: UniqueKey()),
    );
  }
}
