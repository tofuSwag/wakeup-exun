import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wakeup/configs/news_data.dart';
import 'package:wakeup/networking/response_request.dart';

class NetworkingService {
  Future<List<NewsData>> getNewsDataFromApi() async {
    // wake-up-tofuswag.herokuapp.com
    // getNews

    final header = "wake-up-tofuswag.herokuapp.com";
    final path = "getNews";

    final uri = Uri.https(header, path);
    print(uri);

    print("this is working");
    final response = await http.get(uri);
    print("this is not");
    final decodedBody = jsonDecode(response.body);
    // print(decodedBody);
    final newsResponse = ResponseFromRequest.fromJson(decodedBody);
    print("responded");
    return newsResponse.list;

    // if (response.statusCode == 200) {
    //   final decodedBody = jsonDecode(response.body);
    //   final newsResponse = ResponseFromRequest.fromJson(decodedBody);
    //   print("responded");
    //   return newsResponse.list;
    // } else {
    //   print("oops");
    // }
  }
}
