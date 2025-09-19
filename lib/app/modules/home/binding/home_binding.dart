import 'package:get/get.dart';
import 'package:final_project/app/modules/home/controllers/home_controller.dart';
import 'package:final_project/app/data/repositories/note_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}