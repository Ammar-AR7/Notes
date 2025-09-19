import 'package:get/get.dart';
import '../../../data/repositories/note_repository.dart';
import '../../../data/models/model.dart';

class HomeController extends GetxController {
  final _noteRepository = Get.find<NoteRepository>();

  HomeController();
  final notes = <NoteModel>[].obs;
  final selectedNotes  = <NoteModel>[].obs;
  final isLoading = true.obs;
  final isMultiSelectMode = false.obs;

  @override
  void onInit() {
    getActiveNotes();
    super.onInit();
  }

  Future<void> getActiveNotes() async {
    isLoading.value = true;
    notes.value = await _noteRepository.getActiveNotes();
    isLoading.value = false;
  }

  Future<void> addNote(String? title, String content) async {
    final note = NoteModel(title: title,content: content,createdAt: DateTime.now());
    final id = await _noteRepository.addNote(note);
    note.id = id;
    notes.insert(0,note);
  }

  Future<void> editNote(NoteModel note, { String? title,required String content}) async {
    note.title = title;
    note.content = content;
    note.createdAt = DateTime.now();
    await _noteRepository.updateNote(note);
    notes.indexWhere((e) => e.id == note.id);
  }

  Future<void> moveToTrash(NoteModel note) async {
    note.inTrash = true;
    await _noteRepository.moveToTrash(note);
    notes.removeWhere((e) => e.id == note.id);
  }

   // إلغاء وضع التحديد
  void toggleMultiSelectClear() {
    if (isMultiSelectMode.value) {
      isMultiSelectMode.value = false;
      selectedNotes.clear();
      getActiveNotes();
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
      await moveToTrash(note);
    }
    toggleMultiSelectClear();
  }
}


