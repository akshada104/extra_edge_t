import 'package:cached_network_image/cached_network_image.dart';
import 'package:extra_edge_t/http_call/get_rocket_list_controller.dart';
import 'package:extra_edge_t/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'rocket_details_view.dart';

class RocketListView extends StatelessWidget {
  var controller = RocketController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX Rockets'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GetBuilder<RocketController>(
            init: RocketController(),
            id: 'rocket-list',
            builder: (controller) {

              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.rocketList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.getRocketListDetails(id:controller.rocketList[index]['id'] );
                            print(controller.rocketList[index]['id']);
                            Get.to(() => RocketDetailsView(),
                                arguments: {
                                  "id": controller.rocketList[index]['id'],
                                },
                                transition: Transition.noTransition);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.22,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(1.0),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: CachedNetworkImage(
                                                  imageUrl: controller
                                                          .rocketList[index]
                                                      ['flickr_images'][0],
                                                  placeholder: (context, url) {
                                                    return SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                        child: const Center(
                                                            child:
                                                                CircularProgressIndicator()));
                                                  },
                                                  errorWidget:
                                                      (context, url, error) {
                                                    return const Icon(
                                                        Icons.error);
                                                  },
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, left: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${controller.rocketList[index]['name']}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.022,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  child: Text(
                                                    '${controller.rocketList[index]['country']}',
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        color: primaryGreyColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.022,
                                                ),
                                                Text(
                                                  '${controller.rocketList[index]['first_stage']['engines']}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: primaryGreyColor,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }),
      ),
    );
  }
}

class Rocket {
  final String name;
  final String description;
  final List<String> flickrImages;

  Rocket({
    required this.name,
    required this.description,
    required this.flickrImages,
  });
}
