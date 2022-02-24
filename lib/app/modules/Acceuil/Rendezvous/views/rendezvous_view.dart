import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rendezvous_controller.dart';

class RendezvousView extends GetView<RendezvousController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RendezvousView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RendezvousView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
