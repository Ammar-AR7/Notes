import 'package:get/get.dart';
import '../../../data/repositories/note_repository.dart';
import '../../../data/models/model.dart';
import '../../home/controllers/home_controller.dart';

class TrashController extends GetxController {
  final _noteRepository = Get.find<NoteRepository>();
  TrashController();
  final notes = <NoteModel>[].obs;
  final selectedNotes  = <NoteModel>[].obs;
  final isLoading = true.obs;
  final isMultiSelectMode = false.obs;
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    getTrashNotes();
    super.onInit();
  }

  Future<void> getTrashNotes() async {
    isLoading.value = true;
    notes.value = await _noteRepository.getTrashNotes();
    isLoading.value = false;
  }

  Future<void> deleteNote(NoteModel note) async {
    await _noteRepository.deleteNote(note.id!);
    notes.removeWhere((e) => e.id == note.id);
  }

  Future<void> restoreNote(NoteModel note) async {
    note.inTrash = false;
    await _noteRepository.moveToTrash(note);
    notes.removeWhere((e) => e.id == note.id);
    homeController.notes.add(note);
  }

  // إلغاء وضع التحديد
  void toggleMultiSelectClear() {
    if (isMultiSelectMode.value) {
      isMultiSelectMode.value = false;
      selectedNotes.clear();
    }
  }

  //التحديد عبر الضغطة العادية
  void toggleNoteSelection(NoteModel note) {
    if (isMultiSelectMode.value) {
      if (selectedNotes.contains(note)) {
        selectedNotes.remove(note);
      } else {
        selectedNotes.add(note);
      }
    }
  }

  //التحديد عبر الضغطة المطولة وتفعيل وضع التحديد
  void toggleNoteSelectionAndMod(NoteModel note){
    if (!isMultiSelectMode.value) {
      isMultiSelectMode.value = true;
      selectedNotes.add(note);
    }
  }

  Future<void> deleteSelectedNotes() async {
    for (final note in selectedNotes) {
      await deleteNote(note);
    }
    toggleMultiSelectClear();
  }

  Future<void> restoreSelectedNotes() async {
    for (final note in selectedNotes) {
      await restoreNote(note);
    }
    toggleMultiSelectClear();
  }
}