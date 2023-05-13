import 'dart:convert';

class Info {
  int? id;
  String? title;
  String? brief;
  String? contenxt;
  String? mediaPath;
  int? mediaType;
  DateTime? createTime;

  Info({
    this.id,
    this.title,
    this.brief,
    this.contenxt,
    this.mediaPath,
    this.mediaType,
    this.createTime,
  });

  @override
  String toString() {
    return 'Info(id: $id, title: $title, brief: $brief, contenxt: $contenxt, mediaPath: $mediaPath, mediaType: $mediaType, createTime: $createTime)';
  }

  factory Info.fromMap(Map<String, dynamic> data) => Info(
        id: data['id'] as int?,
        title: data['title'] as String?,
        brief: data['brief'] as String?,
        contenxt: data['contenxt'] as String?,
        mediaPath: data['media_path'] as String?,
        mediaType: data['media_type'] as int?,
        createTime: data['create_time'] == null
            ? null
            : DateTime.parse(data['create_time'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'brief': brief,
        'contenxt': contenxt,
        'media_path': mediaPath,
        'media_type': mediaType,
        'create_time': createTime?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Info].
  factory Info.fromJson(String data) {
    return Info.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Info] to a JSON string.
  String toJson() => json.encode(toMap());
}
