import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_clone/app/modules/home/views/movie.dart';
import 'package:flutter/src/widgets/image.dart' as Image;
import '../../../bottombar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'NETFLIX',
            style: TextStyle(
                color: Colors.red, fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.getUserApi(),
                builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: controller.movieList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: GestureDetector(
                            child: Container(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  snapshot.data![index].show!.image == null
                                      ? Image.Image.asset(
                                          "images/img_1.png",
                                          height: Get.height * 0.33,
                                        )
                                      : Image.Image.network(
                                          snapshot.data![index].show!.image!
                                              .medium!,
                                          height: Get.height * 0.33,
                                          // width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                  const SizedBox(height: 3.0,),
                                  Text(snapshot.data![index].show!.name!,style: TextStyle(color: Colors.white,fontSize: 16.0,fontStyle: FontStyle.italic),)
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.toNamed('/detail-screen', arguments: [
                                snapshot.data![index].show!.image!.original,
                                snapshot.data![index].show!.name,
                                snapshot.data![index].show!.premiered,
                                snapshot.data![index].show!.rating!.average,
                                snapshot.data![index].show!.language,
                                snapshot.data![index].show!.summary,
                                snapshot.data![index].show!.genres
                              ]);
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: Bottombar(index: 0),
    );
  }
}

// class ReusableRow extends StatelessWidget {
//   String value;
//   ReusableRow({required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(value),
//         ],
//       ),
//     );
//   }
// }
//
// ReusableRow(
// name: 'Name',
// value: snapshot.data![index].score
//     .toString()),
// ReusableRow(
// name: 'Username',
// value: snapshot.data![index].show
//     .toString()),
// ReusableRow(
// name: 'Email',
// value: snapshot
//     .data![index].show!.language
//     .toString()),
// ReusableRow(
// name: 'Address',
// value: snapshot.data![index].show!.name
//     .toString())
