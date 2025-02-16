//necessary imports
import 'dart:convert';
import 'package:http/http.dart' as http;

// const String baseURL =
//     "https://app-kdbkwlv4sq-uc.a.run.app/v1/";
const String baseURL = "http://10.0.2.2:5001/ideasquare-automation-ffc80/us-central1/app/v1/";
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

Future<dynamic> postRequest(String endpoint, Map<String, dynamic> body) async {
  try {
    final fullURL = baseURL + endpoint;
    print("Requesting: $fullURL");
    print("Request Body: ${jsonEncode(body)}");

    final response = await http.post(
      Uri.parse(fullURL),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      print("JsonDecode: $response.body");
      print("Returing the body");
      return jsonDecode(response.body);
    } else {
      print("Request failed: ${response.reasonPhrase}");
      return {};  // Returning an empty map instead of null
    }
  } catch (e) {
    print("Exception in postRequest: $e");
    return {};  // Return an empty map instead of null
  }
}

