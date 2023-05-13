import 'dart:convert';

class MisdMedia {
  final int id;
  final String misd_hash;
  final String misd_media_path;
  final int is_uesd;
  final String create_date;
  final String update_date;
  MisdMedia({
    required this.id,
    required this.misd_hash,
    required this.misd_media_path,
    required this.is_uesd,
    required this.create_date,
    required this.update_date,
  });

  MisdMedia copyWith({
    int? id,
    String? misd_hash,
    String? misd_media_path,
    int? is_uesd,
    String? create_date,
    String? update_date,
  }) {
    return MisdMedia(
      id: id ?? this.id,
      misd_hash: misd_hash ?? this.misd_hash,
      misd_media_path: misd_media_path ?? this.misd_media_path,
      is_uesd: is_uesd ?? this.is_uesd,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'misd_hash': misd_hash,
      'misd_media_path': misd_media_path,
      'is_uesd': is_uesd,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory MisdMedia.fromMap(Map<String, dynamic> map) {
    return MisdMedia(
      id: map['id'].toInt() as int,
      misd_hash: map['misd_hash'] as String,
      misd_media_path: map['misd_media_path'] as String,
      is_uesd: map['is_uesd'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MisdMedia.fromJson(String source) => MisdMedia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MisdMedia(id: $id, misd_hash: $misd_hash, misd_media_path: $misd_media_path, is_uesd: $is_uesd, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant MisdMedia other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.misd_hash == misd_hash &&
      other.misd_media_path == misd_media_path &&
      other.is_uesd == is_uesd &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      misd_hash.hashCode ^
      misd_media_path.hashCode ^
      is_uesd.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}