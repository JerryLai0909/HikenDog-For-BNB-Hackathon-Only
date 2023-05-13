import 'dart:convert';

import 'package:collection/collection.dart';

import 'mission_desc_info.dart';
import 'mission_media_info.dart';

class MissionInfo {
  int? id;
  String? mission_hash;
  String? owner_hash;
  String? mission_name;
  String? mission_type;
  String? mission_desc1;
  String? mission_desc2;
  String? mission_media_path1;
  String? mission_media_path2;
  String? start_time;
  String? end_time;
  int? is_started;
  int? is_finished;
  int? is_used;
  int? has_nft_reward;
  int? has_token_reward;
  String? create_date;
  String? update_date;
  List<MissionDescInfo>? desc_info;
  List<MissionMediaInfo>? media_info;
  MissionInfo({
    this.id,
    this.mission_hash,
    this.owner_hash,
    this.mission_name,
    this.mission_type,
    this.mission_desc1,
    this.mission_desc2,
    this.mission_media_path1,
    this.mission_media_path2,
    this.start_time,
    this.end_time,
    this.is_started,
    this.is_finished,
    this.is_used,
    this.has_nft_reward,
    this.has_token_reward,
    this.create_date,
    this.update_date,
    this.desc_info,
    this.media_info,
  });

  MissionInfo copyWith({
    int? id,
    String? mission_hash,
    String? owner_hash,
    String? mission_name,
    String? mission_type,
    String? mission_desc1,
    String? mission_desc2,
    String? start_time,
    String? end_time,
    int? is_started,
    int? is_finished,
    int? is_used,
    int? has_nft_reward,
    int? has_token_reward,
    String? create_date,
    String? update_date,
    List<MissionDescInfo>? desc_info,
    List<MissionMediaInfo>? media_info,
  }) {
    return MissionInfo(
      id: id ?? this.id,
      mission_hash: mission_hash ?? this.mission_hash,
      owner_hash: owner_hash ?? this.owner_hash,
      mission_name: mission_name ?? this.mission_name,
      mission_type: mission_type ?? this.mission_type,
      mission_desc1: mission_desc1 ?? this.mission_desc1,
      mission_desc2: mission_desc2 ?? this.mission_desc2,
      start_time: start_time ?? this.start_time,
      end_time: end_time ?? this.end_time,
      is_started: is_started ?? this.is_started,
      is_finished: is_finished ?? this.is_finished,
      is_used: is_used ?? this.is_used,
      has_nft_reward: has_nft_reward ?? this.has_nft_reward,
      has_token_reward: has_token_reward ?? this.has_token_reward,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
      desc_info: desc_info ?? this.desc_info,
      media_info: media_info ?? this.media_info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mission_hash': mission_hash,
      'owner_hash': owner_hash,
      'mission_name': mission_name,
      'mission_type': mission_type,
      'mission_desc1': mission_desc1,
      'mission_desc2': mission_desc2,
      "mission_media_path1": mission_media_path1,
      "mission_media_path2": mission_media_path2,
      'start_time': start_time,
      'end_time': end_time,
      'is_started': is_started,
      'is_finished': is_finished,
      'is_used': is_used,
      'has_nft_reward': has_nft_reward,
      'has_token_reward': has_token_reward,
      'create_date': create_date,
      'update_date': update_date,
      'desc_info': desc_info?.map((x) => x.toMap()).toList(),
      'media_info': media_info?.map((x) => x.toMap()).toList(),
    };
  }

  factory MissionInfo.fromMap(Map<String, dynamic> map) {
    return MissionInfo(
      id: map['id'].toInt() as int,
      mission_hash: map['mission_hash'] as String,
      owner_hash: map['owner_hash'] as String,
      mission_name: map['mission_name'] as String,
      mission_type: map['mission_type'] as String,
      mission_desc1: map['mission_desc1'] as String,
      mission_desc2: map['mission_desc2'] as String,
      mission_media_path1: map['mission_media_path1'] as String,
      mission_media_path2: map['mission_media_path2'] as String,
      start_time: map['start_time'] as String,
      end_time: map['end_time'] as String,
      is_started: map['is_started'].toInt() as int,
      is_finished: map['is_finished'].toInt() as int,
      is_used: map['is_used'].toInt() as int,
      has_nft_reward: map['has_nft_reward'].toInt() as int,
      has_token_reward: map['has_token_reward'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
      desc_info: List<MissionDescInfo>.from(
        (map['desc_info'] as List<dynamic>).map<MissionDescInfo>(
          (x) => MissionDescInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      media_info: List<MissionMediaInfo>.from(
        (map['media_info'] as List<dynamic>).map<MissionMediaInfo>(
          (x) => MissionMediaInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MissionInfo.fromJson(String source) =>
      MissionInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MissionInfo(id: $id, mission_hash: $mission_hash, owner_hash: $owner_hash, mission_name: $mission_name, mission_type: $mission_type, mission_desc1: $mission_desc1, mission_desc2: $mission_desc2, start_time: $start_time, end_time: $end_time, is_started: $is_started, is_finished: $is_finished, is_used: $is_used, has_nft_reward: $has_nft_reward, has_token_reward: $has_token_reward, create_date: $create_date, update_date: $update_date, desc_info: $desc_info, media_info: $media_info)';
  }

  @override
  bool operator ==(covariant MissionInfo other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.mission_hash == mission_hash &&
        other.owner_hash == owner_hash &&
        other.mission_name == mission_name &&
        other.mission_type == mission_type &&
        other.mission_desc1 == mission_desc1 &&
        other.mission_desc2 == mission_desc2 &&
        other.mission_media_path1 == mission_media_path1 &&
        other.mission_media_path2 == mission_media_path2 &&
        other.start_time == start_time &&
        other.end_time == end_time &&
        other.is_started == is_started &&
        other.is_finished == is_finished &&
        other.is_used == is_used &&
        other.has_nft_reward == has_nft_reward &&
        other.has_token_reward == has_token_reward &&
        other.create_date == create_date &&
        other.update_date == update_date &&
        listEquals(other.desc_info, desc_info) &&
        listEquals(other.media_info, media_info);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        mission_hash.hashCode ^
        owner_hash.hashCode ^
        mission_name.hashCode ^
        mission_type.hashCode ^
        mission_desc1.hashCode ^
        mission_desc2.hashCode ^
        mission_media_path1.hashCode ^
        mission_media_path2.hashCode ^
        start_time.hashCode ^
        end_time.hashCode ^
        is_started.hashCode ^
        is_finished.hashCode ^
        is_used.hashCode ^
        has_nft_reward.hashCode ^
        has_token_reward.hashCode ^
        create_date.hashCode ^
        update_date.hashCode ^
        desc_info.hashCode ^
        media_info.hashCode;
  }
}
