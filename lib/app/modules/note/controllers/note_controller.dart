import 'package:final_project/app/data/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:final_project/app/data/repositories/note_repository.dart';


class NoteController extends GetxController{
  NoteModel? note;
  NoteController(this.note);
  late TextEditingController titleController;
  late TextEditingController contentController;

  final _noteRepository = Get.find<NoteRepository>();

  static const String defaultContentText = 'لا يوجد محتوى';

  Future<void> editNote(NoteModel note, { required String title,required String content}) async {
    note.title = title;
    note.content = content;
    note.createdAt = DateTime.now();
    await _noteRepository.updateNote(note);
  }


  @override
  void onInit() {
    if (note?.content == defaultContentText) {
      titleController = TextEditingController(text: note!.title);
      contentController = TextEditingController();
    } else {
      titleController = TextEditingController(text: note?.title);
      contentController = TextEditingController(text: note?.content);
    }
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }

  Future<void> saveNote() async {
    final String trimmedTitle = titleController.text.trim();
    String trimmedContent = contentController.text.trim();

    if (trimmedTitle.isEmpty && trimmedContent.isEmpty) {
      Get.back();
      return;
    }

    if (trimmedContent.isEmpty) {
      trimmedContent = defaultContentText;
    }

    if (note == null) {
      final notes = NoteModel(title: trimmedTitle,content: trimmedContent,createdAt: DateTime.now());
      await _noteRepository.addNote(notes);

    } else {
      editNote(note!, title: trimmedTitle, content: trimmedContent);
    }
    Get.back();
  }
}