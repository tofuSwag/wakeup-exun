import 'package:wakeup/configs/amend_data.dart';

class ResponseFromRequestAmend {
  ResponseFromRequestAmend({this.list});

  List<AmendData> list;

  factory ResponseFromRequestAmend.fromJson(List<dynamic> json) {
    //final list = json as List;
    final objectsList = json.cast<Map<String, dynamic>>();
    final termsList = objectsList.map((e) => AmendData.fromJson(e));

    return ResponseFromRequestAmend(list: termsList.toList());
  }
}
