// ignore_for_file: public_member_api_docs, sort_constructors_first

class ToDo {
  final String id;
  final String title;
  final bool isDone;

  ToDo({
    required this.id,
    required this.title,
    required this.isDone,
  });

  // Convert Firestore data to ToDo entity
  factory ToDo.fromMap(Map<String, dynamic> map, String id) {
    return ToDo(
      id: id,
      title: map['title'],
      isDone: map['isDone'],
    );
  }

  // Convert ToDo entity to Firestore data format
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  ToDo copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return ToDo(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
