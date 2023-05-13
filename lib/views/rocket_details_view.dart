import 'package:cached_network_image/cached_network_image.dart';
import 'package:extra_edge_t/http_call/get_rocket_list_controller.dart';
import 'package:extra_edge_t/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RocketDetailsView extends StatelessWidget {
  const RocketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryGreyColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: Get.back,
        ),
        title: const Text('SpaceX Rockets'),
      ),
      body: GetBuilder<RocketController>(
          init: RocketController(),
          id: 'rocket-list-details',
          builder: (controller) {
            return controller.isDetailsLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        SizedBox(
                          height: Get.height * 0.12,
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white60,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        controller
                                            .rocketListDetailsData['name'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    controller.rocketListDetailsData[
                                                'active'] ==
                                            false
                                        ? Row(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2.0),
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: primaryDarkGreenColor,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                'Active',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryDarkGreenColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2.0),
                                                child: Icon(
                                                  Icons.cancel_outlined,
                                                  color: primaryDarkRedColor,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                'Inactive',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryDarkRedColor,
                                                ),
                                              ),
                                            ],
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.28,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller
                                  .rocketListDetailsData['flickr_images']
                                  .length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              controller.rocketListDetailsData[
                                                  'flickr_images'][index],
                                          placeholder: (context, url) {
                                            return SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                child: const Center(
                                                    child:
                                                        CircularProgressIndicator()));
                                          },
                                          errorWidget: (context, url, error) {
                                            return const Icon(Icons.error);
                                          },
                                        )),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        SizedBox(
                          height: Get.height * 0.15,
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.orange[50],
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Cost Per Launch',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                    Text(
                                      '${controller.rocketListDetailsData['cost_per_launch']}',
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryGreyColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.15,
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.green[50],
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Success Rate Percent',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                    Text(
                                      '${controller.rocketListDetailsData['success_rate_pct']} %',
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryGreyColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.3,
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.pink[50],
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Description',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            controller.launchUrl(Uri.parse(
                                                controller
                                                    .rocketListDetailsData[
                                                        'wikipedia']
                                                    .toString()));
                                          },
                                          child: const Icon(
                                            Icons.more_horiz_outlined,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                    Text(
                                      '${controller.rocketListDetailsData['description']}',
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryGreyColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.15,
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.amber[50],
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.3,
                                          child: const Text(
                                            'Height ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${controller.rocketListDetailsData['height']['meters']}',
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: primaryGreyColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.3,
                                          child: const Text(
                                            'Diameter ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${controller.rocketListDetailsData['height']['meters']}',
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: primaryGreyColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
