import 'package:cached_network_image/cached_network_image.dart';
import 'package:extra_edge_t/http_call/get_rocket_list_controller.dart';
import 'package:extra_edge_t/utils/colors.dart';
import 'package:flutter/material.dart';

class RocketDetailsView extends StatefulWidget {
  RocketDetailsView({super.key, this.rocketListDetailsData});

  Map<String, dynamic>? rocketListDetailsData;

  @override
  State<RocketDetailsView> createState() => _RocketDetailsViewState();
}

class _RocketDetailsViewState extends State<RocketDetailsView> {
  var controller = RocketController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        backgroundColor: tertiaryGreyColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('SpaceX Rockets'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
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
                              widget.rocketListDetailsData!['name'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          widget.rocketListDetailsData!['active'] == false
                              ? Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 2.0),
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
                                      padding: EdgeInsets.only(right: 2.0),
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
                height: MediaQuery.of(context).size.height * 0.28,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        widget.rocketListDetailsData!['flickr_images'].length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: CachedNetworkImage(
                                imageUrl: widget
                                        .rocketListDetailsData!['flickr_images']
                                    [index],
                                placeholder: (context, url) {
                                  return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: const Center(
                                          child: CircularProgressIndicator()));
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
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Text(
                            '${widget.rocketListDetailsData!['cost_per_launch']}',
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
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Text(
                            '${widget.rocketListDetailsData!['success_rate_pct']} %',
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
                height: !controller.isReadMore
                    ? MediaQuery.of(context).size.height * 0.25
                    : MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                onTap: () {
                                  controller.launchUrlCall(controller
                                      .rocketListDetailsData['wikipedia']);
                                },
                                child: const Icon(
                                  Icons.link,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Wrap(
                            children: [
                              Text(
                                widget.rocketListDetailsData!['description'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryGreyColor,
                                ),
                                maxLines: controller.isReadMore ? 10 : 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                padding: const EdgeInsets.all(6),
                                child: GestureDetector(
                                  child: Text(
                                    controller.isReadMore
                                        ? "Read less"
                                        : "Read more",
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  onTap: () {
                                    controller.isReadMore =
                                        !controller.isReadMore;
                                    // controller
                                    //     .update(['rocket-list-details']);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
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
                                width: MediaQuery.of(context).size.width * 0.3,
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
                                '${widget.rocketListDetailsData!['height']['meters']}',
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
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
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
                                '${widget.rocketListDetailsData!['height']['meters']}',
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
        ));
  }
}
