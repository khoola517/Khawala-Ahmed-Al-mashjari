import 'package:finallproject/core/models/DetailesVaccineModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VaccineController extends GetxController {
  Future<List<DetailesVaccine>> fetchVaccines() async {
    try {
      final response = await http.get(
        Uri.parse('http://175.10.30.16:8000/api/StageVaccineDose'),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(response.statusCode);
        print('JSON Response: $jsonResponse');
        print(response.body);
        // تأكد إنه List
        if (jsonResponse is List) {
          return jsonResponse
              .map((json) => DetailesVaccine.fromJson(json))
              .toList();   
        } else {
          throw Exception('Expected a list in the response body');
        }
      } else {
        throw Exception('Failed to load vaccines: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching vaccines: $e');
      rethrow;
    }
  }
}


