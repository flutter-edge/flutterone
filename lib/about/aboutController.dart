import 'dart:async';

import 'package:get/get.dart';

class AboutController{
  //This is the pipeline of "number"
  final StreamController<int> controller = StreamController<int>.broadcast();

  //This is where your "number" go in
  Sink<int> get inputNumber => controller.sink;

  //This is where your "number" go out
  Stream<int> get outputNumber => controller.stream;

  Rx<int> mynumber=0.obs;

  //Dispose
  void dispose() {
    controller.close();
  }
}