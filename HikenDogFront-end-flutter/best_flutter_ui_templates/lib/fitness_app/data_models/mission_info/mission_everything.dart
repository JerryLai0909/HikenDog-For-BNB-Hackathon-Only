import 'dart:convert';

import 'package:best_flutter_ui_templates/fitness_app/data_models/mission_info/mission_reward_info.dart';
import 'package:collection/collection.dart';

import 'misd_desc_info.dart';
import 'misd_media_info.dart';
import 'mountain_info.dart';

class MissionEverything {
   int? id;
   String? misd_hash;
   String? mission_hash;
   String? flag_hash;
   String? mission_type;
   String? start_time;
   String? end_time;
   String? misd_desc1;
   String? misd_desc2;
   String? misd_media_path1;
   String? misd_media_path2;
   int? misd_nft_count;
   int? misd_token_count;
   String? create_date;
   String? update_date;
   String? flag_name;
   String? mo_hash;
   String? flag_desc1;
   String? flag_desc2;
   String? flag_media_path1;
   String? flag_media_path2;
   double? flag_lat;
   double? flag_lon;
   int? flag_location_range;
   MountainInfo? mountain_info;
   List<MisdDesc>? misd_desc;
   List<MisdMedia>? misd_media;
   List<MissionRewardInfo>? rewards;
  MissionEverything({
     this.id,
     this.misd_hash,
     this.mission_hash,
     this.flag_hash,
     this.mission_type,
     this.start_time,
     this.end_time,
     this.misd_desc1,
     this.misd_desc2,
     this.misd_media_path1,
     this.misd_media_path2,
     this.misd_nft_count,
     this.misd_token_count,
     this.create_date,
     this.update_date,
     this.flag_name,
     this.mo_hash,
     this.flag_desc1,
     this.flag_desc2,
     this.flag_media_path1,
     this.flag_media_path2,
     this.flag_lat,
     this.flag_lon,
     this.flag_location_range,
     this.mountain_info,
     this.misd_desc,
     this.misd_media,
     this.rewards,
  });

  MissionEverything copyWith({
    int? id,
    String? misd_hash,
    String? mission_hash,
    String? flag_hash,
    String? mission_type,
    String? start_time,
    String? end_time,
    String? misd_desc1,
    String? misd_desc2,
    String? misd_media_path1,
    String? misd_media_path2,
    int? misd_nft_count,
    int? misd_token_count,
    String? create_date,
    String? update_date,
    String? flag_name,
    String? mo_hash,
    String? flag_desc1,
    String? flag_desc2,
    String? flag_media_path1,
    String? flag_media_path2,
    double? flag_lat,
    double? flag_lon,
    int? flag_location_range,
    MountainInfo? mountain_info,
    List<MisdDesc>? misd_desc,
    List<MisdMedia>? misd_media,
    List<MissionRewardInfo>? rewards,
  }) {
    return MissionEverything(
      id: id ?? this.id,
      misd_hash: misd_hash ?? this.misd_hash,
      mission_hash: mission_hash ?? this.mission_hash,
      flag_hash: flag_hash ?? this.flag_hash,
      mission_type: mission_type ?? this.mission_type,
      start_time: start_time ?? this.start_time,
      end_time: end_time ?? this.end_time,
      misd_desc1: misd_desc1 ?? this.misd_desc1,
      misd_desc2: misd_desc2 ?? this.misd_desc2,
      misd_media_path1: misd_media_path1 ?? this.misd_media_path1,
      misd_media_path2: misd_media_path2 ?? this.misd_media_path2,
      misd_nft_count: misd_nft_count ?? this.misd_nft_count,
      misd_token_count: misd_token_count ?? this.misd_token_count,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
      flag_name: flag_name ?? this.flag_name,
      mo_hash: mo_hash ?? this.mo_hash,
      flag_desc1: flag_desc1 ?? this.flag_desc1,
      flag_desc2: flag_desc2 ?? this.flag_desc2,
      flag_media_path1: flag_media_path1 ?? this.flag_media_path1,
      flag_media_path2: flag_media_path2 ?? this.flag_media_path2,
      flag_lat: flag_lat ?? this.flag_lat,
      flag_lon: flag_lon ?? this.flag_lon,
      flag_location_range: flag_location_range ?? this.flag_location_range,
      mountain_info: mountain_info ?? this.mountain_info,
      misd_desc: misd_desc ?? this.misd_desc,
      misd_media: misd_media ?? this.misd_media,
      rewards: rewards ?? this.rewards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'misd_hash': misd_hash,
      'mission_hash': mission_hash,
      'flag_hash': flag_hash,
      'mission_type': mission_type,
      'start_time': start_time,
      'end_time': end_time,
      'misd_desc1': misd_desc1,
      'misd_desc2': misd_desc2,
      'misd_media_path1': misd_media_path1,
      'misd_media_path2': misd_media_path2,
      'misd_nft_count': misd_nft_count,
      'misd_token_count': misd_token_count,
      'create_date': create_date,
      'update_date': update_date,
      'flag_name': flag_name,
      'mo_hash': mo_hash,
      'flag_desc1': flag_desc1,
      'flag_desc2': flag_desc2,
      'flag_media_path1': flag_media_path1,
      'flag_media_path2': flag_media_path2,
      'flag_lat': flag_lat,
      'flag_lon': flag_lon,
      'flag_location_range': flag_location_range,
      'mountain_info': mountain_info?.toMap(),
      'misd_desc': misd_desc?.map((x) => x.toMap()).toList(),
      'misd_media': misd_media?.map((x) => x.toMap()).toList(),
      'rewards': rewards?.map((x) => x.toMap()).toList(),
    };
  }

  factory MissionEverything.fromMap(Map<String, dynamic> map) {
    return MissionEverything(
      id: map['id'].toInt() as int,
      misd_hash: map['misd_hash'] as String,
      mission_hash: map['mission_hash'] as String,
      flag_hash: map['flag_hash'] as String,
      mission_type: map['mission_type'] as String,
      start_time: map['start_time'] as String,
      end_time: map['end_time'] as String,
      misd_desc1: map['misd_desc1'] as String,
      misd_desc2: map['misd_desc2'] as String,
      misd_media_path1: map['misd_media_path1'] as String,
      misd_media_path2: map['misd_media_path2'] as String,
      misd_nft_count: map['misd_nft_count'].toInt() as int,
      misd_token_count: map['misd_token_count'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
      flag_name: map['flag_name'] as String,
      mo_hash: map['mo_hash'] as String,
      flag_desc1: map['flag_desc1'] as String,
      flag_desc2: map['flag_desc2'] as String,
      flag_media_path1: map['flag_media_path1'] as String,
      flag_media_path2: map['flag_media_path2'] as String,
      flag_lat: map['flag_lat'].toDouble() as double,
      flag_lon: map['flag_lon'].toDouble() as double,
      flag_location_range: map['flag_location_range'].toInt() as int,
      mountain_info:
          MountainInfo.fromMap(map['mountain_info'] as Map<String, dynamic>),
      misd_desc: List<MisdDesc>.from(
        (map['misd_desc'] as List<dynamic>).map<MisdDesc>(
          (x) => MisdDesc.fromMap(x as Map<String, dynamic>),
        ),
      ),
      misd_media: List<MisdMedia>.from(
        (map['misd_media'] as List<dynamic>).map<MisdMedia>(
          (x) => MisdMedia.fromMap(x as Map<String, dynamic>),
        ),
      ),
      rewards: List<MissionRewardInfo>.from(
        (map['rewards'] as List<dynamic>).map<MissionRewardInfo>(
          (x) => MissionRewardInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MissionEverything.fromJson(String source) =>
      MissionEverything.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MissionEverything(id: $id, misd_hash: $misd_hash, mission_hash: $mission_hash, flag_hash: $flag_hash, mission_type: $mission_type, start_time: $start_time, end_time: $end_time, misd_desc1: $misd_desc1, misd_desc2: $misd_desc2, misd_media_path1: $misd_media_path1, misd_media_path2: $misd_media_path2, misd_nft_count: $misd_nft_count, misd_token_count: $misd_token_count, create_date: $create_date, update_date: $update_date, flag_name: $flag_name, mo_hash: $mo_hash, flag_desc1: $flag_desc1, flag_desc2: $flag_desc2, flag_media_path1: $flag_media_path1, flag_media_path2: $flag_media_path2, flag_lat: $flag_lat, flag_lon: $flag_lon, flag_location_range: $flag_location_range, mountain_info: $mountain_info, misd_desc: $misd_desc, misd_media: $misd_media, rewards: $rewards)';
  }

  @override
  bool operator ==(covariant MissionEverything other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.misd_hash == misd_hash &&
        other.mission_hash == mission_hash &&
        other.flag_hash == flag_hash &&
        other.mission_type == mission_type &&
        other.start_time == start_time &&
        other.end_time == end_time &&
        other.misd_desc1 == misd_desc1 &&
        other.misd_desc2 == misd_desc2 &&
        other.misd_media_path1 == misd_media_path1 &&
        other.misd_media_path2 == misd_media_path2 &&
        other.misd_nft_count == misd_nft_count &&
        other.misd_token_count == misd_token_count &&
        other.create_date == create_date &&
        other.update_date == update_date &&
        other.flag_name == flag_name &&
        other.mo_hash == mo_hash &&
        other.flag_desc1 == flag_desc1 &&
        other.flag_desc2 == flag_desc2 &&
        other.flag_media_path1 == flag_media_path1 &&
        other.flag_media_path2 == flag_media_path2 &&
        other.flag_lat == flag_lat &&
        other.flag_lon == flag_lon &&
        other.flag_location_range == flag_location_range &&
        other.mountain_info == mountain_info &&
        listEquals(other.misd_desc, misd_desc) &&
        listEquals(other.misd_media, misd_media) &&
        listEquals(other.rewards, rewards);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        misd_hash.hashCode ^
        mission_hash.hashCode ^
        flag_hash.hashCode ^
        mission_type.hashCode ^
        start_time.hashCode ^
        end_time.hashCode ^
        misd_desc1.hashCode ^
        misd_desc2.hashCode ^
        misd_media_path1.hashCode ^
        misd_media_path2.hashCode ^
        misd_nft_count.hashCode ^
        misd_token_count.hashCode ^
        create_date.hashCode ^
        update_date.hashCode ^
        flag_name.hashCode ^
        mo_hash.hashCode ^
        flag_desc1.hashCode ^
        flag_desc2.hashCode ^
        flag_media_path1.hashCode ^
        flag_media_path2.hashCode ^
        flag_lat.hashCode ^
        flag_lon.hashCode ^
        flag_location_range.hashCode ^
        mountain_info.hashCode ^
        misd_desc.hashCode ^
        misd_media.hashCode ^
        rewards.hashCode;
  }
}
