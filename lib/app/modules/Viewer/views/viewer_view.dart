import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/viewer_controller.dart';

class ViewerView extends GetView<ViewerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ViewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
