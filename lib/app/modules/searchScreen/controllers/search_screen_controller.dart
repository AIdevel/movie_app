import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home/views/movie.dart';
import 'package:http/http.dart' as http;

class SearchScreenController extends GetxController {
  //TODO: Implement SearchScreenController

  TextEditingController searchController = TextEditingController();
  // RxString searchTerm = ''.obs;
  // var movieList = <dynamic>[].obs;

  List<Movie> movieList = [];
  RxString search = 'hello'.obs;
  // RxList searchList = <Movie>[].obs;
  // List<searchMovieList>
  getSearchApi(String searchTerm) async {
    final http.Response response =
    await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        movieList.add(Movie.fromJson(i));
      }
      print(movieList);
      search.value = 'hello$searchTerm';
      return movieList;
    } else {
      return movieList;
    }
  }



  final count = 0.obs;
  @override
  void onInit() {
      // getSearchApi('all');
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
