import 'package:finallproject/core/constant/colors.dart';
import 'package:finallproject/core/provider/vaccine_provider.dart';
import 'package:finallproject/core/view/managescreen.dart';
import 'package:flutter/material.dart';
import 'package:finallproject/core/models/vaccine_model.dart';
import 'package:get/get.dart';

class VaccineScreen extends StatefulWidget {
  const VaccineScreen({Key? key}) : super(key: key);
  @override
  State<VaccineScreen> createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {
  final VaccineProvider _provider = VaccineProvider();

  late Future<List<VaccineModel>> _vaccinesFuture; 
  
  @override
  void initState() {
    super.initState();
    _vaccinesFuture = _provider.getVaccines();
  }

  Future<void> _reloadVaccines() async {
    setState(() {
      _vaccinesFuture = _provider.getVaccines();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<VaccineModel>>(
          future: _provider.getVaccines(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } 
            else if (snapshot.hasError) {
              return Center(child: Text('حدث خطأ: ${snapshot.error}'));
            } 
            else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد تعليقات'));
          }
            
            else {
              final vaccines = snapshot.data!;
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: vaccines.length,
                itemBuilder: (context, index) {
                  final vaccine = vaccines[index];
                  
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        vaccine.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       const SizedBox(height: 8),
                       Text(vaccine.description,
                       style: const TextStyle(fontSize: 16),), 
                       const SizedBox(height: 8),
                       
                     ],
                  ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Managescreen(vaccine: vaccine),
                              ),
                            ).then((_) => _reloadVaccines());
                          } else if (value == 'delete') {
                            _provider.deleteVaccine(vaccine.id!).then((_) => _reloadVaccines());
                          }
                        },
                        itemBuilder: (context) => [
                           PopupMenuItem(value: 'edit', child: Text("4".tr)),
                           PopupMenuItem(value: 'delete', child: Text("5".tr)),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
       
        floatingActionButton: SizedBox(
          width: 100,
          height: 40,
          child: FloatingActionButton(
            
            onPressed: () {
              Get.to(Managescreen())!.then((_) => _reloadVaccines());
            },
            backgroundColor: AppColor.primarycolor,
            child:  Text(
              "14".tr,
              style:const TextStyle(
                color: Colors.white,)
            ),
            
          ),
        ),
      ),
    );
  }
}



