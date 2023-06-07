import 'package:extra_edge_t/http_call/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final rocketProvider = ChangeNotifierProvider((ref) {
  return RocketController();
});

class RocketController extends ChangeNotifier {
  var repository = Repository();

  List<Map<String, dynamic>> rocketList = [];
  Map<String, dynamic> rocketListDetailsData = {};
  bool isLoading = true;
  bool isDetailsLoading = true;
  bool isReadMore = true;

  // @override
  // void onInit() {
  //   getRocketList();
  //   super.onInit();
  // }

  /// function to get data from get rocket list api
  getRocketList() async {
    try {
      await repository.getRocketList().then((value) {
        rocketList = value;
      });
      notifyListeners();
      isLoading = false;
    } catch (e) {
      debugPrint('error caught: $e');
    }
  }

  /// function to launch/redirect to url
  void launchUrlCall(Uri url) async {
    var url = '';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
