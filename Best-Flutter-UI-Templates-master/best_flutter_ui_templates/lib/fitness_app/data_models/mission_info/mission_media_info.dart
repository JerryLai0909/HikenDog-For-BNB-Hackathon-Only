import 'dart:convert';

class MissionMediaInfo {
  final int id;
  final String mission_hash;
  final String mission_media_path;
  final int is_used;
  final String create_date;
  final String update_date;
  MissionMediaInfo({
    required this.id,
    required this.mission_hash,
    required this.mission_media_path,
    required this.is_used,
    required this.create_date,
    required this.update_date,
  });

  MissionMediaInfo copyWith({
    int? id,
    String? mission_hash,
    String? mission_media_path,
    int? is_used,
    String? create_date,
    String? update_date,
  }) {
    return MissionMediaInfo(
      id: id ?? this.id,
      mission_hash: mission_hash ?? this.mission_hash,
      mission_media_path: mission_media_path ?? this.mission_media_path,
      is_used: is_used ?? this.is_used,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mission_hash': mission_hash,
      'mission_media_path': mission_media_path,
      'is_used': is_used,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory MissionMediaInfo.fromMap(Map<String, dynamic> map) {
    return MissionMediaInfo(
      id: map['id'].toInt() as int,
      mission_hash: map['mission_hash'] as String,
      mission_media_path: map['mission_media_path'] as String,
      is_used: map['is_used'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MissionMediaInfo.fromJson(String source) => MissionMediaInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MissionMediaInfo(id: $id, mission_hash: $mission_hash, mission_media_path: $mission_media_path, is_used: $is_used, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant MissionMediaInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.mission_hash == mission_hash &&
      other.mission_media_path == mission_media_path &&
      other.is_used == is_used &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      mission_hash.hashCode ^
      mission_media_path.hashCode ^
      is_used.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}