import 'dart:convert';

class MissionDescInfo {
  final int id;
  final String mission_hash;
  final String mission_desc_content;
  final int is_used;
  final String create_date;
  final String update_date;
  MissionDescInfo({
    required this.id,
    required this.mission_hash,
    required this.mission_desc_content,
    required this.is_used,
    required this.create_date,
    required this.update_date,
  });

  MissionDescInfo copyWith({
    int? id,
    String? mission_hash,
    String? mission_desc_content,
    int? is_used,
    String? create_date,
    String? update_date,
  }) {
    return MissionDescInfo(
      id: id ?? this.id,
      mission_hash: mission_hash ?? this.mission_hash,
      mission_desc_content: mission_desc_content ?? this.mission_desc_content,
      is_used: is_used ?? this.is_used,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mission_hash': mission_hash,
      'mission_desc_content': mission_desc_content,
      'is_used': is_used,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory MissionDescInfo.fromMap(Map<String, dynamic> map) {
    return MissionDescInfo(
      id: map['id'].toInt() as int,
      mission_hash: map['mission_hash'] as String,
      mission_desc_content: map['mission_desc_content'] as String,
      is_used: map['is_used'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MissionDescInfo.fromJson(String source) => MissionDescInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MissionDescInfo(id: $id, mission_hash: $mission_hash, mission_desc_content: $mission_desc_content, is_used: $is_used, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant MissionDescInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.mission_hash == mission_hash &&
      other.mission_desc_content == mission_desc_content &&
      other.is_used == is_used &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      mission_hash.hashCode ^
      mission_desc_content.hashCode ^
      is_used.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}