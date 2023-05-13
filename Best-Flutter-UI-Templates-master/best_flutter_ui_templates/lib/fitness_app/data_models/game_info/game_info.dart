import 'dart:convert';

import 'package:collection/collection.dart';

import 'game_desc_info.dart';
import 'game_media_info.dart';

class GameInfo {
  final int id;
  final String game_hash;
  final String game_name;
  final String game_desc1;
  final String game_desc2;
  final String game_media_path1;
  final String game_media_path2;
  final String create_date;
  final String update_date;
  final List<GameDescInfo> game_desc;
  final List<GameMediaInfo> game_media;

  GameInfo({
    required this.id,
    required this.game_hash,
    required this.game_name,
    required this.game_desc1,
    required this.game_desc2,
    required this.game_media_path1,
    required this.game_media_path2,
    required this.create_date,
    required this.update_date,
    required this.game_desc,
    required this.game_media,
  });

  GameInfo copyWith({
    int? id,
    String? game_hash,
    String? game_name,
    String? game_desc1,
    String? game_desc2,
    String? game_media_path1,
    String? game_media_path2,
    String? create_date,
    String? update_date,
    List<GameDescInfo>? game_desc,
    List<GameMediaInfo>? game_media,
  }) {
    return GameInfo(
      id: id ?? this.id,
      game_hash: game_hash ?? this.game_hash,
      game_name: game_name ?? this.game_name,
      game_desc1: game_desc1 ?? this.game_desc1,
      game_desc2: game_desc2 ?? this.game_desc2,
      game_media_path1: game_media_path1 ?? this.game_media_path1,
      game_media_path2: game_media_path2 ?? this.game_media_path2,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
      game_desc: game_desc ?? this.game_desc,
      game_media: game_media ?? this.game_media,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'game_hash': game_hash,
      'game_name': game_name,
      'game_desc1': game_desc1,
      'game_desc2': game_desc2,
      'game_media_path1': game_media_path1,
      'game_media_path2': game_media_path2,
      'create_date': create_date,
      'update_date': update_date,
      'game_desc': game_desc.map((x) => x.toMap()).toList(),
      'game_media': game_media.map((x) => x.toMap()).toList(),
    };
  }

  factory GameInfo.fromMap(Map<String, dynamic> map) {
    return GameInfo(
      id: map['id'].toInt() as int,
      game_hash: map['game_hash'] as String,
      game_name: map['game_name'] as String,
      game_desc1: map['game_desc1'] as String,
      game_desc2: map['game_desc2'] as String,
      game_media_path1: map['game_media_path1'] as String,
      game_media_path2: map['game_media_path2'] as String,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
      game_desc: List<GameDescInfo>.from(
        (map['game_desc'] as List<dynamic>).map<GameDescInfo>(
          (x) => GameDescInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      game_media: List<GameMediaInfo>.from(
        (map['game_media'] as List<dynamic>).map<GameMediaInfo>(
          (x) => GameMediaInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameInfo.fromJson(String source) =>
      GameInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GameInfo(id: $id, game_hash: $game_hash, game_name: $game_name, game_desc1: $game_desc1, game_desc2: $game_desc2, game_media_path1: $game_media_path1, game_media_path2: $game_media_path2, create_date: $create_date, update_date: $update_date, game_desc: $game_desc, game_media: $game_media)';
  }

  @override
  bool operator ==(covariant GameInfo other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.game_hash == game_hash &&
        other.game_name == game_name &&
        other.game_desc1 == game_desc1 &&
        other.game_desc2 == game_desc2 &&
        other.game_media_path1 == game_media_path1 &&
        other.game_media_path2 == game_media_path2 &&
        other.create_date == create_date &&
        other.update_date == update_date &&
        listEquals(other.game_desc, game_desc) &&
        listEquals(other.game_media, game_media);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        game_hash.hashCode ^
        game_name.hashCode ^
        game_desc1.hashCode ^
        game_desc2.hashCode ^
        game_media_path1.hashCode ^
        game_media_path2.hashCode ^
        create_date.hashCode ^
        update_date.hashCode ^
        game_desc.hashCode ^
        game_media.hashCode;
  }
}
