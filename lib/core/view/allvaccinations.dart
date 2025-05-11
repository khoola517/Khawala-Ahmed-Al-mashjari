import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/core/models/AllVaccinationModel.dart';
import 'package:finallproject/core/provider/AllVaccinationProvider.dart';
import 'package:finallproject/core/view/completed_vaccniation.dart';
import 'package:finallproject/core/view/upcoming_vaccinations.dart';
import 'package:finallproject/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaccinationDetailsPage extends StatelessWidget {
  final int childId;

  VaccinationDetailsPage({required this.childId});

  final controller = Get.put(VaccinationDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('تفاصيل التطعيم')),
      body: FutureBuilder<AllVaccinationModel>(
        future: controller.fetchVaccinationData(childId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('لا توجد بيانات'));
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Text('${data.childName ?? 'غير معروف'}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('${data.completedDoses?.allDoses ?? 0}/${data.completedDoses?.completedDoses?? 0}تم اكمالها',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('العمر: ${data.childAge ?? ''}'),
                Text('الجنس: ${data.childGender ?? ''}'),
                

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Custombuttonauth(
                      text: "23".tr,onPressed: (){},  
                      width: 70, height: 45, 
                      color: AppColor.primarycolor, 
                      textColor: AppColor.backgroundcolor, 
                    ),
                    Custombuttonauth(
                      text: "24".tr,
                      onPressed: (){Get.to(CompletedVaccniation(childId: childId,));},  
                      width: 70, 
                      height: 45, 
                      color: Colors.grey, 
                      textColor: AppColor.primarycolor, 
                    ),
                    Custombuttonauth(
                      text: "25".tr,
                      onPressed: (){Get.to(UpcomingVaccinations(childId: childId,));},  
                      width: 90, 
                      height: 45, 
                      color: Colors.grey, textColor:  AppColor.primarycolor, 
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        //Text('📌 جميع التطعيمات: ${data.completedDoses?.allDoses ?? 0}'),
                        //Text('✅ المكتملة: ${data.completedDoses?.completedDoses ?? 0}'),
                        //Text('🕒 القادمة: ${data.upcomingDoses?.upComingDoses ?? 0}'),
                      Text('التطعيمات المكتملة(${data.completedDoses?.allDoses ?? 0}/${data.completedDoses?.completedDoses?? 0})',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    ...?data.completedDoses?.doses?.map((dose) => ListTile(
                        leading: Container(height: 25,width:25,color: Colors.green, child: const  Icon(Icons.check, color: Colors.white)),
                        title: Text('${dose.vaccineName ?? ''}'),
                        subtitle: Text('  تم التطعيم في ${dose.visitDate ?? ''}\n ${dose.doseNumber ?? ''}'),
                      )),
                      const SizedBox(height: 20),
                      Text('التطعيمات قيد الانتظار(${data.completedDoses?.allDoses ?? 0}/${data.upcomingDoses?.upComingDoses ?? 0})',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    ...?data.upcomingDoses?.theDoses?.map((dose) => ListTile(
                        leading: const Icon(Icons.schedule, color: Colors.orange),
                        title: Text('${dose.vaccineName ?? ''}'),
                        subtitle: Text('موعد التطعيم ${dose.vaccinationDate ?? ''} \n ${dose.doseNumber ?? ''} '),
                      )),
                    
                    ],),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
