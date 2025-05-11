import 'dart:convert';
import 'package:finallproject/core/models/AllVaccinationModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class VaccinationDetailsController extends GetxController {
  
  Future<AllVaccinationModel> fetchVaccinationData(int childId) async {
    try {
      final response = await http.get(
        Uri.parse('http://175.10.30.16:8000/api/getAllChildDoses/$childId'),
        
      );

      if (response.statusCode == 200) {
        return AllVaccinationModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load children - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ: $e');
    }
  }
}
