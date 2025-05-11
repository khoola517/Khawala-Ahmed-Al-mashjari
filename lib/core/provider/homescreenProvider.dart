import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:finallproject/core/models/homescreenModel.dart';
import 'package:get/get.dart';

class IndexPageController extends GetxController {
  Future<IndexModel> fetchData(String token) async {
    try {
      final response = await http.get(
        Uri.parse('http://175.10.30.16:8000/api/parent/index'), 
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // var jsonResponse =jsonDecode(response.body);
        // print(jsonResponse);
        
        return IndexModel.fromJson(json.decode(response.body));
        
      } else {
        throw Exception('Failed to load children - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}


