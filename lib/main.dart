import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'item_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Together Pagination Task'),
        ),
        body: ItemsListView(),
      ),
    );
  }
}

class ItemsListView extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (itemController.isLoading.value && itemController.items.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (itemController.items.isEmpty) {
        return const Center(
          child: Text('No items available.'),
        );
      } else {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              itemController.loadItems();
            }
            return true;
          },
          child: ListView.builder(
            itemCount: itemController.items.length,
            itemBuilder: (context, index) {
              final item = itemController.items[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListTile(
                  title: Text(item['title'] ?? 'Data Missing'),
                  subtitle: Text(item['description'] ?? 'Data Missing'),
                  leading: Image.asset(
                    item['image_url'],
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
