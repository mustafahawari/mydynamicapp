import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meroapp/model/content_model.dart';

class ApiServices {
  static Future getContent() async {
    final url =
        Uri.parse("https://meropadai.com/wp-json/wp/v2/posts/?embed=true");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decodedResult = jsonDecode(response.body);
        List<ContentModel> contents =  List.from(decodedResult)
            .map(
              (e) => ContentModel.fromJson(e),
            )
            .toList();
        return contents;
      }

    } catch (e) {
      throw e;
    }
  }
}
