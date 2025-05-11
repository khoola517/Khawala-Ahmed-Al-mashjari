
import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/core/provider/loginProvider.dart';
import 'package:finallproject/core/utility.dart';
import 'package:finallproject/widget/custombutton.dart';
import 'package:finallproject/widget/customtextfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
   const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  //final AuthController _authController = Get.put(AuthController());
    LoginControllerImp controller = Get.put(LoginControllerImp());
     //LoginController controller1=Get.put(LoginControllerImp());
    return Scaffold(
      body: 
      Form(
        key: controller.formstate,
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 130,),
              //const Logoauth(),
              Image.asset("images/logo.png",height: 137,width: 127,fit: BoxFit.fill,),
              Customtextformfield(
                mycontroller: controller.username,
                validator: requiredValidator,
                hinttext: "15".tr,
              
              ),
              Customtextformfield(
                mycontroller: controller.password, 
                validator: requiredValidator,
                hinttext: "16".tr,
             // onChanged: (value)=>controller.password,
               ),
              const SizedBox(height: 100,),
              Custombuttonauth(
                text: "17".tr,
                onPressed: (){
                  //Get.to(HomePage());
                  controller.login();
                  }, 
                width: 200, 
                height: 50, 
                color: AppColor.primarycolor, 
                textColor: AppColor.backgroundcolor,
                 ),
            ],
          ),
        ),
      ),
    );
  }
}