import 'package:http/http.dart' as http;

/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 30/1/24
 */
class APIService {
  static var client = http.Client();
  static var BaseURL = 'https://apps.piit.us/new/carrental/api/v1/';

  static Future<String?> fetchData(String url, {String bearerToken = ''}) async {
    var response = await client.get(Uri.parse(BaseURL + url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': "Bearer "+bearerToken,
    });
    print("Fetch Data Api Response : ${response.body}");
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Data fetch error!!";
    }
  }

  static Future<String> postData(String url, Object data, {String bearerToken = ''}) async {
    final response = await http.post(
      Uri.parse(BaseURL + url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Bearer "+bearerToken,
      },
      body: data,
    );
    print("Post Data Api Response : ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 401) {
      return response.body;
    } else {
      return "failed !!";
    }
  }

  static Future<String?> deleteData(String url, Object data, {String bearerToken = ''}) async {
    var response = await client.post(
      Uri.parse(BaseURL + url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Bearer "+bearerToken,
      },
      body: data,
    );
    print("Delete Data Api Response : ${response.body}");
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Failed!!";
    }
  }

  static Future<String> updateData(String url, Object data, {String bearerToken = ''}) async {
    final response = await http.post(
      Uri.parse(BaseURL + url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Bearer "+bearerToken,
      },
      body: data,
    );

    print("Update Data Api Response : ${response.body}");

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Failed!!";
    }
  }
}
