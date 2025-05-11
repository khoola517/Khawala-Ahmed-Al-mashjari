import 'dart:convert';

import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/core/models/DescriptionVaccineModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:finallproject/core/models/DetailesVaccineModel.dart';


class VaccineDetailView extends StatelessWidget {
  final int? vaccineId;

  VaccineDetailView({this.vaccineId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        //title:  Text('اسم اللقاح "${data.vaccineName}"', style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        backgroundColor: AppColor.backgroundcolor,
        leading: IconButton(
          onPressed: (){ 
            Get.back();
            }, 
          icon:const Icon(
            Icons.arrow_back_ios,
            color: AppColor.primarycolor,),
        ),),
      body: FutureBuilder<Data>(
        future: fetchVaccineDetails(vaccineId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطا: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('لا يوجد اي وصف'));
          }

          final data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اسم اللقاح "${data.vaccineName}"', 
                style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(' الوصف العام  :\n ${data.vaccineDescription}',
                style:const TextStyle(fontSize: 18,)),
                const SizedBox(height: 10),
                const Text('مشاهدة كافة جرعات اللقاح',
                style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                Expanded(
                  child: Container(
                    //height: 120,
                   // width: 300,
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("الجرعة",
                              style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              Text("العمر",
                              style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(children: [ ...?data.vaccineDoses?.map((dose) => Text('${dose.doseNumber}')),],),
                            Column(children: [ ...?data.vaccineDoses?.map((dose) => Text(' ${dose.vaccineAge}')),],),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),       
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Data> fetchVaccineDetails(int? id) async {
    final response = await http.get(Uri.parse('http://175.10.30.16:8000/api/StageVaccineDose/$id'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(response.statusCode);
        print('JSON Response: $jsonResponse');

      return DescriptionVaccine.fromJson(jsonResponse).data!;
      

    } else {
      print(response.statusCode);

      throw Exception('Failed to load vaccine details');
    }
  }
}