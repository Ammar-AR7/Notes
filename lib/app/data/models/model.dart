class NoteModel{
  int? id;
  String? title;
  String content;
  DateTime createdAt;
  bool inTrash;

  NoteModel({
    this.id,
    this.title,
    required this.content,
    required this.createdAt,
    this.inTrash = false,
  });

  NoteModel.fromMap(Map<String, dynamic> res):
    id = res['id'] as int?,
    title = res['title'] as String?,
    content = res['content'] as String,
    createdAt = DateTime.fromMillisecondsSinceEpoch(res['created_at'] as int),
    inTrash = (res['in_trash'] as int) == 1;

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt.millisecondsSinceEpoch,
      'in_trash': inTrash ? 1 : 0,
    };
  }
}