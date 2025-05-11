import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/core/utility.dart';
import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String hinttext ;
  final TextEditingController mycontroller ;
  final FormFieldValidator<String>? validator;
  //final String? Function(String?) valid;
  //final bool isnumber;
  const Customtextformfield(
    {super.key, 
    required this.hinttext, 
    required this.mycontroller, 
    required this.validator, 
    //required this.valid, 
    //required String? Function(String? val) validator, 
    //required Function(dynamic val) valid
    });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin:const EdgeInsets.only(top: 20),
      child: TextFormField(
        validator:  requiredValidator,
        controller: mycontroller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.symmetric(vertical: 5),
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            
          ),
         focusedBorder:const OutlineInputBorder(
             borderSide: BorderSide(color:AppColor.backgroundcolor,width: 3)
          ),
          enabledBorder:const OutlineInputBorder(
             borderSide: BorderSide(color:Colors.blueAccent,width: 3)
          ),
           errorBorder: const OutlineInputBorder(
         // borderSide: BorderSide(color: Colors.red),
        ),
          filled: true,
          fillColor: AppColor.primarycolor,
          
        ),
      ),
    );
  }
}














// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.label,
//     this.validator, 
//     required this.maxLines,
//   });

//   final TextEditingController controller;
//   final String label;
//   final FormFieldValidator<String>? validator;
//   final int maxLines;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       validator: requiredValidator,
//       maxLines:maxLines,
//       decoration: InputDecoration(
//         label: Text(label),
//         border: const OutlineInputBorder(),
//         enabledBorder: const OutlineInputBorder(),
//         errorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.red),
//         ),
//       ),
//     );
//   }
// }
