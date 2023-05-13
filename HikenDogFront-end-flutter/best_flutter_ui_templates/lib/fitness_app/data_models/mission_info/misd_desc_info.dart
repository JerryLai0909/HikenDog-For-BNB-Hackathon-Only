import 'dart:convert';

class MisdDesc {
  final int id;
  final String misd_hash;
  final String misd_desc_content;
  final int is_used;
  final String create_date;
  final String update_date;
  MisdDesc({
    required this.id,
    required this.misd_hash,
    required this.misd_desc_content,
    required this.is_used,
    required this.create_date,
    required this.update_date,
  });

  MisdDesc copyWith({
    int? id,
    String? misd_hash,
    String? misd_desc_content,
    int? is_used,
    String? create_date,
    String? update_date,
  }) {
    return MisdDesc(
      id: id ?? this.id,
      misd_hash: misd_hash ?? this.misd_hash,
      misd_desc_content: misd_desc_content ?? this.misd_desc_content,
      is_used: is_used ?? this.is_used,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'misd_hash': misd_hash,
      'misd_desc_content': misd_desc_content,
      'is_used': is_used,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory MisdDesc.fromMap(Map<String, dynamic> map) {
    return MisdDesc(
      id: map['id'].toInt() as int,
      misd_hash: map['misd_hash'] as String,
      misd_desc_content: map['misd_desc_content'] as String,
      is_used: map['is_used'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MisdDesc.fromJson(String source) => MisdDesc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MisdDesc(id: $id, misd_hash: $misd_hash, misd_desc_content: $misd_desc_content, is_used: $is_used, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant MisdDesc other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.misd_hash == misd_hash &&
      other.misd_desc_content == misd_desc_content &&
      other.is_used == is_used &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      misd_hash.hashCode ^
      misd_desc_content.hashCode ^
      is_used.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}