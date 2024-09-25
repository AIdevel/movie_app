import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home/views/movie.dart';
import 'package:http/http.dart' as http;

class SearchScreenController extends GetxController {
  //TODO: Implement SearchScreenController

  TextEditingController searchController = TextEditingController();
  // RxString searchTerm = ''.obs;
  var movieList = <dynamic>[].obs;


  getSearchApi(String searchTerm) async {
    final http.Response response =
    await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm'));
    // var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(response.body.toString());

      movieList.value=items;

      print(movieList[0]);
      // movieList = searchList;
      return items[0];
    } else {
      return null;
    }
  }



  final count = 0.obs;
  @override
  void onInit() {
      getSearchApi('all');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
