import 'dart:convert';

class NoteModel {
  final String title;
  final String description;
  final DateTime createdat;
  NoteModel({
    this.title,
    this.description,
    this.createdat,
  });

  NoteModel copyWith({
    String title,
    String description,
    DateTime createdat,
  }) {
    return NoteModel(
      title: title ?? this.title,
      description: description ?? this.description,
      createdat: createdat ?? this.createdat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdat': createdat?.millisecondsSinceEpoch,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NoteModel(
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
      'NoteModel(title: $title, description: $description, createdat: $createdat)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NoteModel &&
        o.title == title &&
        o.description == description &&
        o.createdat == createdat;
  }

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ createdat.hashCode;
}
