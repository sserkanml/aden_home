// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Notes {

 final String notes_id;
 final String content;
  Notes({
    required this.notes_id,
    required this.content,
  });
 


  Notes copyWith({
    String? notes_id,
    String? content,
  }) {
    return Notes(
      notes_id: notes_id ?? this.notes_id,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'notes_id': notes_id,
      'content': content,
    };
  }

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      notes_id: map['notes_id'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notes.fromJson(String source) => Notes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Notes(notes_id: $notes_id, content: $content)';

  @override
  bool operator ==(covariant Notes other) {
    if (identical(this, other)) return true;
  
    return 
      other.notes_id == notes_id &&
      other.content == content;
  }

  @override
  int get hashCode => notes_id.hashCode ^ content.hashCode;
}
