import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemController extends GetxController {
  final String apiUrl =
      'https://mock.together.buzz/mocks/discovery?format=json&limit=10';
  var items = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var page = 1;

  @override
  void onInit() {
    loadItems();
    super.onInit();
  }

  void loadItems() async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      var response = await http.get(Uri.parse('$apiUrl&page=$page'));
      print(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            Map<String, dynamic>.from(jsonDecode(response.body));
        List<Map<String, dynamic>> newItems =
            List<Map<String, dynamic>>.from(data['data']);
        if (newItems.isNotEmpty) {
          items.addAll(newItems);
        }
        page = data['page'] + 1;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
