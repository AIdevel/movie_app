import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_screen_controller.dart';

class DetailScreenView extends GetView<DetailScreenController> {
  const DetailScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.dataOfMovie = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.3,
                color: Colors.white,
                width: Get.width,
                child: Image(
                  image: controller.dataOfMovie[0]==null?AssetImage('images/img_1.png'):NetworkImage('${controller.dataOfMovie[0]}'),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  controller.dataOfMovie[1],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Text(
                  '  ${controller.dataOfMovie[2]} | ' + '${controller.dataOfMovie[3]} |',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.image,
                  color: Colors.white,
                )
              ]),
              const SizedBox(
                height: 5,
              ),
              Row(children: [
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.movie,
                  color: Colors.white,
                ),
                Text(
                  '  ${controller.dataOfMovie[4]} | ' + 'Hindi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.closed_caption,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'EN',
                  style: TextStyle(color: Colors.white),
                )
              ]),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                padding: const EdgeInsets.only(left: 18),
                height: Get.height * 0.075,
                width: Get.width * 0.95,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 30,
                        ),
                        Text(
                          "Play",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              Container(
                padding: const EdgeInsets.only(right: 10, left: 18),
                height: Get.height * 0.075,
                width: Get.width * 0.98,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_download_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Download",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  maxLines: 4,
                  controller.dataOfMovie[5],
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '   Genre  ${controller.dataOfMovie[6][0]} | ${controller.dataOfMovie[6].length > 1 ? controller.dataOfMovie[6][1] : 'Adventure'}  | Comedy',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 12,
              ),
              // Container(
              //   height: Get.height * 0.06,
              //   width: Get.width,
              //   color: Colors.red,
              //   child: const Center(
              //     child: Text(
              //       textAlign: TextAlign.center,
              //       '  More Movies',
              //       style: TextStyle(
              //           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
