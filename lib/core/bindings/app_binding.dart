import 'package:final_project/app/data/repositories/note_repository.dart';
import 'package:final_project/core/services/utils/database_services.dart';
import 'package:get/get.dart';
import '../../app/modules/home/controllers/home_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesProcess>(() => NotesProcess(Get.find<DatabaseServices>()), fenix: true);
    Get.lazyPut<NoteRepository>(() => NoteRepository(Get.find<NotesProcess>()), fenix: true);
  }

}