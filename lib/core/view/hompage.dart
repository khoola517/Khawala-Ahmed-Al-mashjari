
import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/widget/customicon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/homepageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 // تأكد من استيراد HomePageController هنا

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageController(),
      child: Consumer<HomePageController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text(controller.titles[controller.currentIndex])),
              leading: SizedBox(width:70,child: customicon(icon: Icons.menu)),
              actions: [
                if (controller.currentIndex == 0) ...[
                  customicon(icon: Icons.person)
                  // Container(
                  //   decoration: BoxDecoration(
                  //     //color: Colors.blue[100],
                  //     color: Colors.blue,
                  //     shape: BoxShape.circle
                  //   ),
                  //   child: IconButton(
                  //     icon: Icon(Icons.person),
                  //     style: IconButton.styleFrom(backgroundColor: Colors.blue[100],foregroundColor: Colors.white),
                  //     onPressed: () {
                  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add button pressed")));
                  //     },
                  //   ),
                  // ),
                ],
                if (controller.currentIndex == 1) ...[
                  customicon(icon: Icons.vaccines)
                ],
                if (controller.currentIndex == 2) ...[
                  customicon(icon: Icons.logout)
                ],
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor:  AppColor.primarycolor,
              currentIndex: controller.currentIndex,
              onTap: (value) {
                controller.currentIndex = value;
              },
              items: [
                BottomNavigationBarItem(
                   icon:const Icon(
                    Icons.home_outlined), 
                    label: "9".tr),

                BottomNavigationBarItem(
                  icon:const Icon(Icons.vaccines), 
                  label: "12".tr
                ),

                BottomNavigationBarItem(
                  icon:const Icon(Icons.comment), 
                  label: "13".tr),
              ],
              type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.white,
               showSelectedLabels: true, 
               showUnselectedLabels: true, 
            ), 
            body: controller.screen[controller.currentIndex],
          );
        },
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//    HomePage({super.key});
//    HomePageController controller =Get.put(HomePageController());
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomePageController>(builder: (controller)=>Scaffold(
//       appBar: AppBar(
//         title:Center(child: Text(controller.titles[controller.currentindex].tr)),
//         leading: IconButton(
//           icon: Icon(Icons.menu), // أيقونة يسارية
//           onPressed: () {
//             // وظيفة الأيقونة اليسارية
//             Get.snackbar('Menu', 'Menu button pressed');
//           },
//         ),
//         actions: [
//           if (controller.currentindex == 0) ...[
           
//             IconButton(
//               icon:const  Icon(Icons.person), // أيقونة الصفحة الأولى
//               onPressed: () {
//                 Get.snackbar('Add', 'Add button pressed');
//               },
//             ),
//           ],
//           if (controller.currentindex == 1) ...[
           
//             IconButton(
//               icon: Icon(Icons.arrow_back_ios), // أيقونة الصفحة الثانية
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ],
//           if (controller.currentindex == 2) ...[
//             IconButton(
//               icon: Icon(Icons.logout), // أيقونة الصفحة الثالثة
//               onPressed: () {
//                 Get.snackbar('Logout', 'Logout button pressed');
//               },
//             ),
//           ],
//         ]
//         //leading:Padding(
//       //   padding:const EdgeInsets.all(10),
//       //   child:Container(
//       //     alignment: Alignment.center,
          
//       //     width: 20,
//       //     height: 20,
//       //     decoration: BoxDecoration(
//       //       border: Border.all(color:  ColorApp.primarycolor,width: 3),
//       //       shape: BoxShape.circle),
//       //       child: IconButton(onPressed: (){}, icon:Center(child: Icon(Icons.person,size: 20,))),) ,),
//        ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor:  AppColor.primarycolor,
//         currentIndex: controller.currentindex,
//         onTap: (value) {
//           controller.currentindex = value;
//           controller.update();
//         },
//         items:[
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 20),label: "9".tr,),
//         BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon:Image.asset("images/injection.png", height: 30, // حجم الصورة
//         width: 30,)),label: "38".tr),
//         BottomNavigationBarItem(icon: Icon(Icons.person,size: 20),label:"37".tr),  
//       ],
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.red, // لون الأيقونة النشطة
//       unselectedItemColor: Colors.white, // لون الأيقونات غير النشطة
//       showSelectedLabels: true, // عرض التسميات للأيقونات النشطة
//       showUnselectedLabels: true, // عرض التسميات للأيقونات غير النشطة
//       ),
//       body:controller.screen[controller.currentindex],
//     ));  
//   }
// }