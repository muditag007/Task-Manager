import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class AllApi {
  String baseUrl = "https://taskmanage-ftoc.onrender.com";

  getData(data,tag) async {
    final response = await http.post(
      Uri.parse(baseUrl+tag),
      body: json.encode(data),
      headers: {"Content-Type": "application/json"},
    );
    print(json.decode(response.body));
    return json.decode(response.body);
  }
}
