import 'package:http/http.dart' as http;
import 'package:wakeup/configs/news_data.dart';

class NetworkingService {
  Future<List<NewsData>> getNewsDataFromApi() async {
    // wake-up-tofuswag.herokuapp.com
    // getNews

    final header = "wake-up-tofuswag.herokuapp.com";
    final path = "getNews";

    final uri = Uri.http(header, path);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
    } else {}
  }
}
