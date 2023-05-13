import 'dart:convert';

class GameMediaInfo {
  final int id;
  final String game_hash;
  final String game_media_path;
  final int is_used;
  final String create_date;
  final String update_date;
  GameMediaInfo({
    required this.id,
    required this.game_hash,
    required this.game_media_path,
    required this.is_used,
    required this.create_date,
    required this.update_date,
  });

  GameMediaInfo copyWith({
    int? id,
    String? game_hash,
    String? game_media_path,
    int? is_used,
    String? create_date,
    String? update_date,
  }) {
    return GameMediaInfo(
      id: id ?? this.id,
      game_hash: game_hash ?? this.game_hash,
      game_media_path: game_media_path ?? this.game_media_path,
      is_used: is_used ?? this.is_used,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'game_hash': game_hash,
      'game_media_path': game_media_path,
      'is_used': is_used,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory GameMediaInfo.fromMap(Map<String, dynamic> map) {
    return GameMediaInfo(
      id: map['id'].toInt() as int,
      game_hash: map['game_hash'] as String,
      game_media_path: map['game_media_path'] as String,
      is_used: map['is_used'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameMediaInfo.fromJson(String source) => GameMediaInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GameMediaInfo(id: $id, game_hash: $game_hash, game_media_path: $game_media_path, is_used: $is_used, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant GameMediaInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.game_hash == game_hash &&
      other.game_media_path == game_media_path &&
      other.is_used == is_used &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      game_hash.hashCode ^
      game_media_path.hashCode ^
      is_used.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}