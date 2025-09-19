import '../controllers/trash_controller.dart';
import 'package:get/get.dart';


class TrashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrashController>(() => TrashController());
  }
}