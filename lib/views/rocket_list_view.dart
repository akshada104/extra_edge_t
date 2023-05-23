import 'package:cached_network_image/cached_network_image.dart';
import 'package:extra_edge_t/http_call/get_rocket_list_controller.dart';
import 'package:extra_edge_t/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'rocket_details_view.dart';

class RocketListView extends ConsumerStatefulWidget {
  const RocketListView({super.key});

  @override
  _RocketListViewState createState() => _RocketListViewState();
}

class _RocketListViewState extends ConsumerState {
  var controller = RocketController();

  @override
  void initState() {
    super.initState();
    ref.read(rocketProvider.notifier).getRocketList(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(rocketProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('SpaceX Rockets'),
        ),
        body: data.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: data.rocketList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RocketDetailsView(
                                  rocketListDetailsData:
                                      data.rocketList[index]),
                            ));
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(1.0),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: CachedNetworkImage(
                                              imageUrl: data.rocketList[index]
                                                  ['flickr_images'][0],
                                              placeholder: (context, url) {
                                                return SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    child: const Center(
                                                        child:
                                                            CircularProgressIndicator()));
                                              },
                                              errorWidget:
                                                  (context, url, error) {
                                                return const Icon(Icons.error);
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
                                              '${data.rocketList[index]['name']}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
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
                                                '${data.rocketList[index]['country']}',
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
                                              '${data.rocketList[index]['first_stage']['engines']}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: primaryGreyColor,
                                                  fontWeight: FontWeight.w700),
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
                )));
  }
}
