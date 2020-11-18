import 'package:wakeup/configs/news_data.dart';

class ResponseFromRequest {
  ResponseFromRequest({this.list});

  List<NewsData> list;

  factory ResponseFromRequest.fromJson(Map<String, dynamic> json) {
    // if (json['list'] is List) {
    //   final list = json['list'] as List;
    //   final objectsList = list.cast<Map<String, dynamic>>();
    //   final termsList = objectsList.map((e) => NewsData.fromJson(e));

    //   return ResponseFromRequest(list: termsList.toList());
    // }
    final list = json['list'] as List;
    final objectsList = list.cast<Map<String, dynamic>>();
    final termsList = objectsList.map((e) => NewsData.fromJson(e));

    return ResponseFromRequest(list: termsList.toList());
  }
}
