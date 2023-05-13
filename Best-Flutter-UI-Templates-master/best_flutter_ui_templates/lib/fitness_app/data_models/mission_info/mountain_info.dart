import 'dart:convert';

class MountainInfo {
  final int id;
  final String mo_hash;
  final String mo_name;
  final String mo_desc1;
  final String mo_desc2;
  final String mo_media_path1;
  final String mo_media_path2;
  final int mission_count;
  final int line_count;
  final int nft_count;
  final int token_count;
  final String create_date;
  final String update_date;
  MountainInfo({
    required this.id,
    required this.mo_hash,
    required this.mo_name,
    required this.mo_desc1,
    required this.mo_desc2,
    required this.mo_media_path1,
    required this.mo_media_path2,
    required this.mission_count,
    required this.line_count,
    required this.nft_count,
    required this.token_count,
    required this.create_date,
    required this.update_date,
  });

  MountainInfo copyWith({
    int? id,
    String? mo_hash,
    String? mo_name,
    String? mo_desc1,
    String? mo_desc2,
    String? mo_media_path1,
    String? mo_media_path2,
    int? mission_count,
    int? line_count,
    int? nft_count,
    int? token_count,
    String? create_date,
    String? update_date,
  }) {
    return MountainInfo(
      id: id ?? this.id,
      mo_hash: mo_hash ?? this.mo_hash,
      mo_name: mo_name ?? this.mo_name,
      mo_desc1: mo_desc1 ?? this.mo_desc1,
      mo_desc2: mo_desc2 ?? this.mo_desc2,
      mo_media_path1: mo_media_path1 ?? this.mo_media_path1,
      mo_media_path2: mo_media_path2 ?? this.mo_media_path2,
      mission_count: mission_count ?? this.mission_count,
      line_count: line_count ?? this.line_count,
      nft_count: nft_count ?? this.nft_count,
      token_count: token_count ?? this.token_count,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mo_hash': mo_hash,
      'mo_name': mo_name,
      'mo_desc1': mo_desc1,
      'mo_desc2': mo_desc2,
      'mo_media_path1': mo_media_path1,
      'mo_media_path2': mo_media_path2,
      'mission_count': mission_count,
      'line_count': line_count,
      'nft_count': nft_count,
      'token_count': token_count,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory MountainInfo.fromMap(Map<String, dynamic> map) {
    return MountainInfo(
      id: map['id'].toInt() as int,
      mo_hash: map['mo_hash'] as String,
      mo_name: map['mo_name'] as String,
      mo_desc1: map['mo_desc1'] as String,
      mo_desc2: map['mo_desc2'] as String,
      mo_media_path1: map['mo_media_path1'] as String,
      mo_media_path2: map['mo_media_path2'] as String,
      mission_count: map['mission_count'].toInt() as int,
      line_count: map['line_count'].toInt() as int,
      nft_count: map['nft_count'].toInt() as int,
      token_count: map['token_count'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MountainInfo.fromJson(String source) => MountainInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MountainInfo(id: $id, mo_hash: $mo_hash, mo_name: $mo_name, mo_desc1: $mo_desc1, mo_desc2: $mo_desc2, mo_media_path1: $mo_media_path1, mo_media_path2: $mo_media_path2, mission_count: $mission_count, line_count: $line_count, nft_count: $nft_count, token_count: $token_count, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant MountainInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.mo_hash == mo_hash &&
      other.mo_name == mo_name &&
      other.mo_desc1 == mo_desc1 &&
      other.mo_desc2 == mo_desc2 &&
      other.mo_media_path1 == mo_media_path1 &&
      other.mo_media_path2 == mo_media_path2 &&
      other.mission_count == mission_count &&
      other.line_count == line_count &&
      other.nft_count == nft_count &&
      other.token_count == token_count &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      mo_hash.hashCode ^
      mo_name.hashCode ^
      mo_desc1.hashCode ^
      mo_desc2.hashCode ^
      mo_media_path1.hashCode ^
      mo_media_path2.hashCode ^
      mission_count.hashCode ^
      line_count.hashCode ^
      nft_count.hashCode ^
      token_count.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}