import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/src/widgets/image.dart' as Image;
import '../../../bottombar.dart';
import '../../home/views/movie.dart';
import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64.0, left: 6, bottom: 10),
              child: SizedBox(
                width: Get.width * 0.90,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  // onFieldSubmitted: (input)=> controller.getSearchApi(input),
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search_outlined,),
                      color: Colors.white,
                        onPressed: () => controller.getSearchApi(controller.searchController.text)
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red), // Set enabled border color
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red), // Set focused border color
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red), // Set error border color
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.orange), // Set focused error border color
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child:
                 Obx(()=>
                   controller.search.isNotEmpty?ListView.separated(
                          itemCount: controller.movieList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(right: 14),
                              height: Get.height * 0.2,
                              width: Get.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3), // Shadow color
                                    offset: const Offset(0, 2), // X and Y offset
                                    blurRadius: 10, // Blur effect
                                    spreadRadius: 2, // Spread of the shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    controller.movieList[index].show!.image==null?Image.Image.asset("images/img_1.png"):
                                     Image.Image.network(
                                       controller.movieList[index].show!.image!.original!,
                                      height: Get.height * 0.38,
                                      // width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                             controller.movieList[index].show!.name!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              '${controller.movieList[index].show!.rating!.average ?? '0.0'}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                             controller.movieList[index].show!.type!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              controller.movieList[index].show!.language!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            // Text(
                                            //   'Generic',
                                            //   style: TextStyle(
                                            //     fontSize: 16,
                                            //     color: Colors.white,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          controller.movieList[index].show!.summary!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 5),
                        ): const Center(
                     child: Text(
                       'Nothing Found!',
                       style: TextStyle(
                           color: Colors.white38, fontSize: 20),
                     ),
                   ),
                 ),

              ),
          ],
        ),
      ), bottomNavigationBar:const Bottombar(index: 1)
    );
  }
}
