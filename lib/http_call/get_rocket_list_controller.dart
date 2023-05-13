
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

  @override
  void onInit() {
    getRocketList();
    super.onInit();
  }

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

  void launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }
}
