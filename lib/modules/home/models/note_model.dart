import 'dart:convert';

class NoteModel {
  final int id;
  final String title;
  final String description;
  final DateTime createdat;
  NoteModel({
    this.id,
    this.title,
    this.description,
    this.createdat,
  });

  NoteModel copyWith({
    int id,
    String title,
    String description,
    DateTime createdat,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdat: createdat ?? this.createdat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': title,
      'description': description,
      'createdat': createdat?.millisecondsSinceEpoch,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NoteModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      createdat: DateTime.fromMillisecondsSinceEpoch(map['createdat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'NoteModel(id: $id, title: $title, description: $description, createdat: $createdat)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NoteModel &&
        o.id == id &&
        o.title == title &&
        o.description == description &&
        o.createdat == createdat;
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ description.hashCode ^ createdat.hashCode;
}
