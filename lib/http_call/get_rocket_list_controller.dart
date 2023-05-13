import 'package:extra_edge_t/http_call/repository.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketController extends GetxController {
  var repository = Repository();

  List<Map<String, dynamic>> rocketList = [];
  List<Map<String, dynamic>> rocketListDetails = [];
  Map<String, dynamic> rocketListDetailsData = {};
  bool isLoading = true;
  bool isDetailsLoading = true;
  bool isReadMore = true;

  @override
  void onInit() {
    getRocketList();
    super.onInit();
  }

  /// function to get data from get rocket list api
  void getRocketList() async {
    try {
      await repository.getRocketList().then((value) {
        rocketList = value;
      });
      update(['rocket-list']);
      isLoading = false;
    } catch (e) {
      print('error caught: $e');
    }
  }

  /// api to get rocket list details api
  void getRocketListDetails({
    required String id,
  }) async {
    try {
      await repository.getRocketListDetails(id: id).then((value) {
        rocketListDetailsData = value;
      });
      update(['rocket-list-details']);
      isDetailsLoading = false;
    } catch (e) {
      print('error caught: $e');
    }
  }

  /// function to launch/redirect to url
  void launchUrlCall(Uri url) async {
    var url = 'https://api.flutter.dev/flutter/material/Icons-class.html';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
