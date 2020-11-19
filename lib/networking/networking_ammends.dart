import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wakeup/configs/amend_data.dart';
import 'package:wakeup/networking/response_amend.dart';

class NetworkingAmmend {
  Future<List<AmendData>> getAmendsDataFromApi() async {
    // wake-up-tofuswag.herokuapp.com
    // getNews

    final header = "wake-up-tofuswag.herokuapp.com";
    final path = "ammends/getAmmends";

    final uri = Uri.https(header, path);
    final response = await http.get(uri);
    final decodedBody = jsonDecode(response.body);
    final newsResponse = ResponseFromRequestAmend.fromJson(decodedBody);
    return newsResponse.list;
  }
}
