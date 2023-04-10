import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:view_builder/view_builder.dart';

class HomePageController extends GetxController {
  static HomePageController get find => Get.find();
  int length = 5;
  LoadingStatus isMoreLoading = LoadingStatus.completed;
  Rx<LoadingStatus> loadingStatus = LoadingStatus.completed.obs;

  late ScrollController scrollController;

  void listner() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = LoadingStatus.loading;
      update();
      await Future.delayed(const Duration(seconds: 3));
      length += 5;
      //make api call for load more
    }
    isMoreLoading = LoadingStatus.completed;
    update();
  }

  Future<void> _getData() async {
    loadingStatus.value = LoadingStatus.loading;
    update();
    //make api call
    length = 0;
    length = length + 5;
    await Future.delayed(const Duration(seconds: 3));

    loadingStatus.value = LoadingStatus.completed;

    if (loadingStatus.value == LoadingStatus.error) {
      loadingStatus.value = LoadingStatus.error;
    }
    update();
  }

  Future<void> onRefresh() async => await _getData();

  @override
  void onInit() {
    onRefresh();
    scrollController = ScrollController()..addListener(listner);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
