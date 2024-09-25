import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_app_clone/app/modules/home/views/movie.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  List<Movie> movieList = [];
  Future<List<Movie>> getUserApi() async {
    final http.Response response =
    await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        movieList.add(Movie.fromJson(i));
      }
      print(movieList);
      return movieList;
    } else {
      return movieList;
    }
  }

  void routePage(int index){
    if(index == 0){
      Get.toNamed('/home');
    }else if(index == 1){
      Get.toNamed('/search-screen');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getUserApi();
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
