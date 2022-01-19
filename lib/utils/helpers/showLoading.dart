// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
      title: "Loading...",
      content: const CircularProgressIndicator(),
      barrierDismissible: true);
}

dismissLoadingWidget() {
  Get.back();
}
