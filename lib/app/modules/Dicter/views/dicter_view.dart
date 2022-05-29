import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dicter_controller.dart';

class DicterView extends GetView<DicterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DicterView'),
          centerTitle: true,
        ),
        body: Container(
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/record.jpg"),
                  fit: BoxFit.cover)),
        ));
  }
}
