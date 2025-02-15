//necessary imports
import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseURL = "http://localhost:5001/ideasquare-automation-ffc80/us-central1/app/v1/";

Future<Map<String,dynamic>?> getRequest(String endpoint,Map<String,String>? headers) async {
  try{
    final fullURL = baseURL+endpoint;
    final response = await http.get(Uri.parse(fullURL),headers: headers);

    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to retrieve data!");
    }
  }catch(e){
    return null;
  }

}