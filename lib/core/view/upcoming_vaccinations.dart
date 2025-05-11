import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/core/models/AllVaccinationModel.dart';
import 'package:finallproject/core/provider/AllVaccinationProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingVaccinations extends StatelessWidget {
  final int childId;
   UpcomingVaccinations({super.key, required this.childId});
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

          return Scaffold(
            appBar: AppBar(title: Text('10'.tr),),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Expanded(
                child: Column(
                  children: [
                    
                    Container(
                      height: 450,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                height: 150,
                                width: 400,
                                decoration:const BoxDecoration(
                                color: AppColor.waringcolor,
                                borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5), ),
                                 ),
                                 child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text('${data.childName ?? 'غير معروف'}',style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                    const Text("لتواصل المسيرة", style: TextStyle(fontSize: 20)),
                                    Text('التطعيمات قيد الانتظار(${data.completedDoses?.allDoses ?? 0}/${data.upcomingDoses?.upComingDoses ?? 0}تطعيمات قيد الانتظار'),
                                    //Text('12/${data.upcomingDoses?? 0}تم اكمالها',style:const TextStyle(fontSize: 20, )),
                                    //Text('✅ المكتملة: ${data.completedDoses?.completedDoses ?? 0}'),
                                    //Text('🕒 القادمة: ${data.upcomingDoses?.upComingDoses ?? 0}'),
                                    
                                  ],
                                  
                    
                                 ),
                              ),
                              
                             
                              ],
                    
                            ),
                            //const Text('✅ التطعيمات المكتملة:',style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 7),
                                 Text('التطعيمات قيد الانتظار(${data.upcomingDoses?.upComingDoses ?? 0}/12)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    ...?data.upcomingDoses?.theDoses?.map((dose) => ListTile(
                        leading: const Icon(Icons.schedule, color: Colors.orange),
                        title: Text('${dose.vaccineName ?? ''}'),
                        subtitle: Text('موعد التطعيم ${dose.vaccinationDate ?? ''} \n ${dose.doseNumber ?? ''} '),
                      )
                      ),
                            
                          ],
                        ),
                      ),
                    ),
                  ],
                  
                ),
              ),
            ),
          );
        },
      ),
    );
  } 
}

// class UpcomingVaccinations extends StatefulWidget {
//   const UpcomingVaccinations({super.key});

//   @override
//   State<UpcomingVaccinations> createState() => _UpcomingVaccinationsState();
// }

// class _UpcomingVaccinationsState extends State<UpcomingVaccinations> {
//   ApiController controller = Get.put(ApiController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorApp.backgroundcolor,
//       appBar: AppBar(centerTitle: true,title: Text("11".tr),backgroundColor: ColorApp.backgroundcolor,
//         leading:  IconButton(
//         icon: Icon(Icons.arrow_back_ios,color: ColorApp.primarycolor,), // أيقونة الصفحة الثانية
//         onPressed: () {
//           Get.back();
//         },
//       ),),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
//           child: Container( 
//             height: 450,
//             width: 400,
//             child: Card(
//             color: Colors.white,
//             elevation: 5,
//             child: Column(
//              children: [
//               Stack(
//                 children: [
//                     Container(
//                       height: 150,
//                       width: 400,
//                       decoration:const BoxDecoration(
//                         color: ColorApp.waringcolor,
//                         borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(15),
//                         bottomRight: Radius.circular(15),
//                         topLeft: Radius.circular(5),
//                         topRight: Radius.circular(5), ),
//                         ),
//                         child: ListView.builder(
//                           //scrollDirection: Axis.vertical,
//                         //itemCount: controller.posts.length,
//                         itemCount: controller.api.length,
//                         itemBuilder: (context,index){
//                           return  Container(
//                                    // height: 60,
//                                     //decoration: BoxDecoration(),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                      children: [
//                                       Text(controller.api[index].id!.toString()),
//                                       Text(controller.api[index].userId!.toString()),
//                                      //Text(controller.api[index].title!.tr),
//                                       // Text(controller1.api[pos].title!),
//                                       // Text(controller1.api[pos].title!),
//                                      ],
//                                     ),
//                                   ); 
//                     })  ,
//                   )
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Container(
//                     height: 250,
                    
//                     //color: Colors.blue,
//                     child:ListView.builder(
//                           //scrollDirection: Axis.vertical,
//                         //itemCount: controller.posts.length,
//                         itemCount: controller.api.length,
//                         itemBuilder: (context,index){
//                           return  Container(
//                                    // height: 60,
//                                     //decoration: BoxDecoration(),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                      children: [
//                                        Row(
//                                             children: [
//                                               Container(height: 25,width: 25,color: Colors.red,child: Icon(Icons.close,color: Colors.white,),),
//                                               SizedBox(width: 20,),
//                                               Text(controller.api[index].id!.toString()),
//                                             ],
//                                           ),
//                                       Text(controller.api[index].id!.toString()),
//                                       Text(controller.api[index].userId!.toString()),
//                                      //Text(controller.api[index].title!.tr),
//                                       // Text(controller1.api[pos].title!),
//                                       // Text(controller1.api[pos].title!),
//                                      ],
//                                     ),); 
//                     }) ,
//                   ),
//                 )
//               ],
//              ),
//             )   
//            ),
//         ),
//       ),
//     );
//   }
// }
