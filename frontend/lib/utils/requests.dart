//necessary imports
import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseURL =
    "http://10.0.2.2:5001/ideasquare-automation-ffc80/us-central1/app/v1/";
Future<dynamic>? getRequest(String endpoint) async {
  try {
    final fullURL = baseURL + endpoint;
    print(fullURL);
    final response = await http.get(
      Uri.parse(fullURL),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to retrieve data!");
    }
  } catch (e) {
    return null;
  }
}

Future<dynamic>? postRequest(String endpoint, Map<String, dynamic> body) async {
  try {
    final fullURL = baseURL + endpoint;
    print(fullURL);
    final response = await http.post(
      Uri.parse(fullURL),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to retrieve data!");
    }
  } catch (e) {
    return null;
  }
}
