import 'package:finallproject/core/models/DescriptionVaccineModel.dart';
import 'package:finallproject/core/models/homescreenModel.dart';
import 'package:finallproject/core/provider/homescreenProvider.dart';
import 'package:finallproject/core/view/allvaccinations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  final token=Get.arguments??"not token";
   Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$token'),),
    );
  }
}

class IndexPage extends StatelessWidget {
  
  final token=Get.arguments??"not token";

  IndexPage({super.key });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IndexPageController());

    return Scaffold(
      body: FutureBuilder<IndexModel>(
        future: controller.fetchData(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطا: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.children == null) {
            return const Center(child: Text('لم يتم العثور على أطفال'));
          }

          final children = snapshot.data!.children!;

          return ListView.builder(
            itemCount: children.length,
            itemBuilder: (context, index) {
              final child = children[index];
              return InkWell(
                onTap: () {
                  if (child.iD!= null) {
                    Get.to(() => VaccinationDetailsPage(childId: child.iD!));
                } else {
                    Get.snackbar('خطأ', 'لا يوجد معرّف لهذا الطفل');
                }
                },
                child: Card(

                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${child.firstName ?? 'غير معروف'} - ${child.age}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text('التطعيمات: ${child.completedVaccinations}/${child.allVaccinations}'),
                            Text('التطعيمات المكتملة: ${child.completedVaccinations}'),
                           
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(child.allVaccinations ?? 12, (i) {
                        Color color;
                           if (i < (child.completedVaccinations ?? 0)) {
                             color = child.gender == 'ذكر'
                             ? Colors.blue
                             : (child.gender == 'أنثى' ? Colors.pink : Colors.grey);
                       } else {
                         color = Colors.grey;
                   }
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 15,
                  height: 30,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
                            }),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // النص التوضيحي
                        Text(
                          '${child.completedVaccinations ?? 0} من ${child.allVaccinations ?? 12} تطعيمات مكتملة',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                     
                      ],
                    ),
                  ],
                ),
                
                      ),
                    ],
                  ),
                ),
              );
              
            },
          );
        },
      ),
       //bottomNavigationBar: HighEndNavbar(),
      
    );
  }
}