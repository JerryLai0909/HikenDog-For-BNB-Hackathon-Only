import 'dart:convert';

class Temp {
  String? className;
  String? path;
  int? userId;
  int? id;
  String? title;
  String? body;

  Temp({
    this.className,
    this.path,
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  @override
  String toString() {
    return 'Temp(className: $className, path: $path, userId: $userId, id: $id, title: $title, body: $body)';
  }

  factory Temp.fromMap(Map<String, dynamic> data) => Temp(
        className: data['__className'] as String?,
        path: data['__path'] as String?,
        userId: data['userId'] as int?,
        id: data['id'] as int?,
        title: data['title'] as String?,
        body: data['body'] as String?,
      );

  Map<String, dynamic> toMap() => {
        '__className': className,
        '__path': path,
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Temp].
  factory Temp.fromJson(String data) {
    return Temp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Temp] to a JSON string.
  String toJson() => json.encode(toMap());

  Temp copyWith({
    String? className,
    String? path,
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Temp(
      className: className ?? this.className,
      path: path ?? this.path,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
