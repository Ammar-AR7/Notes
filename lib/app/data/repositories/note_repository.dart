import '../models/model.dart';
import '../../../core/services/utils/database_services.dart';

class NoteRepository {
  final NotesProcess _notesProcess;

  NoteRepository(this._notesProcess);

  Future<int> addNote(NoteModel note) async {
    return _notesProcess.insert(note.toMap());
  }

  Future<int> updateNote(NoteModel note) async {
    return _notesProcess.update(note.toMap());
  }

  Future<int> moveToTrash(NoteModel note) async {
    return _notesProcess.moveToTrash(note.toMap());
  }

  Future<int> deleteNote(int id) async {
    return _notesProcess.delete(id);
  }

  Future<List<NoteModel>> getTrashNotes() async {
    final res = await _notesProcess.getAll(where: 'in_trash = ?', whereArgs: [1]);
    return res.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<List<NoteModel>> getActiveNotes() async {
    final res = await _notesProcess.getAll(where: 'in_trash = ?', whereArgs: [0]);
    return res.map((e) => NoteModel.fromMap(e)).toList();
  }
}
