import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PlayerView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/player.jpg"),
                    fit: BoxFit.fill)),
          ),
        ));
  }
}
