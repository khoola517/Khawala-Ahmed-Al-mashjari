import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/core/models/vaccine_model.dart';
import 'package:finallproject/core/provider/vaccine_provider.dart';
import 'package:finallproject/core/utility.dart';
import 'package:finallproject/widget/custombutton.dart';
import 'package:finallproject/widget/customtextfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Managescreen extends StatefulWidget {
  
  const Managescreen({super.key, this.vaccine});
  final VaccineModel? vaccine;
  @override
  State<Managescreen> createState() => _ManagescreenState();
}

class _ManagescreenState extends State<Managescreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  final _provider = VaccineProvider();
  final _formKey = GlobalKey<FormState>();
  late final bool _isEdit;
  @override
  void initState() {
    super.initState();
    final vaccine = widget.vaccine;
    if (vaccine != null) {
      _titleController = TextEditingController(text: vaccine.title);
      _descriptionController = TextEditingController(text: vaccine.description);
      _isEdit = true;
    } else {
      _titleController = TextEditingController();
      _descriptionController = TextEditingController();
      _isEdit = false;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        _isEdit ? '10'.tr : '14'.tr,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: (){
          Get.back();
        }
        , icon:const Icon(
          Icons.arrow_back_ios,
          color: AppColor.primarycolor,)),
       
      ),
      body: Form(
       key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Customtextformfield(hinttext: "35".tr, mycontroller: _titleController,  validator: requiredValidator,
              ),

              const SizedBox(height: 16),

               Customtextformfield(hinttext:"7".tr, mycontroller: _descriptionController,validator: requiredValidator,   
                ),

              const SizedBox(height: 32),

              Custombuttonauth(text:"18".tr, width:200, height:50, color:AppColor.primarycolor, textColor: AppColor.backgroundcolor,
               onPressed: () async {
                   if (_formKey.currentState!.validate()) {
                      final vaccine = VaccineModel(
                       title: _titleController.text,
                        description: _descriptionController.text,
                    );
                    if (_isEdit) {
                         await _provider.updateVaccine(vaccine);
                        } else {
                          await _provider.addVaccine(vaccine);
                        }

                 //await _provider.addVaccine(vaccine);
                  Get.back();
              }           
             }),
            ],
          ),
        ),
      ),
    );
  }
}