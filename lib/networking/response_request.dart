import 'package:wakeup/configs/news_data.dart';

class ResponseFromRequest {
  ResponseFromRequest({this.list});

  List<NewsData> list;

  factory ResponseFromRequest.fromJson(List<dynamic> json) {
    //final list = json as List;
    final objectsList = json.cast<Map<String, dynamic>>();
    final termsList = objectsList.map((e) => NewsData.fromJson(e));

    return ResponseFromRequest(list: termsList.toList());
  }
}
