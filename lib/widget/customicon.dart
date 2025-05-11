import 'package:finallproject/core/constant/colors.dart';
import 'package:flutter/material.dart';

import '../core/constant/colors.dart';

class customicon extends StatelessWidget {
  final IconData icon;
  const customicon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue[100],
                      color: Colors.blue,
                      shape: BoxShape.circle
                    ),
                    child: IconButton(
                      icon: Icon(icon),
                      style: IconButton.styleFrom(backgroundColor: Colors.blue[100],foregroundColor: Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add button pressed")));
                      },
                    ),
                  ),
    );
  }
}