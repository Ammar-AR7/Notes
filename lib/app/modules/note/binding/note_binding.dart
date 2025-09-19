import 'package:get/get.dart';
import '../../../data/models/model.dart';
import '../controllers/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    final NoteModel? note = Get.arguments;
    Get.lazyPut<NoteController>(() => NoteController(note));
  }
}