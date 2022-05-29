import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pdf_controller.dart';

class PdfView extends GetView<PdfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PdfView'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/pdf.jpg"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
