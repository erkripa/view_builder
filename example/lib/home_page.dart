import 'package:example/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:view_builder/view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("View Builder Example"),
      ),
      body: GetBuilder<HomePageController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ItemViewBuilder(
                  length: controller.length,
                  loadingStatus: controller.loadingStatus.value,
                  scrollController: controller.scrollController,
                  isMoreLoading: controller.isMoreLoading,
                  emptyDataText: "No Data!",
                  onRefresh: controller.onRefresh,
                  itemBuilder: (context, index) {
                    return Card(child: ListTile(leading: Text("index $index")));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
