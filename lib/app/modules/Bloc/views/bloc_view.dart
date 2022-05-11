import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bloc_controller.dart';

class BlocView extends GetView<BlocController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlocView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BlocView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
