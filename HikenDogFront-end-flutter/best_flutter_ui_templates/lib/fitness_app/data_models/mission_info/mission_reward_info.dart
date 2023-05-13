import 'dart:convert';

class MissionRewardInfo {
  final int id;
  final String misd_hash;
  final String reward_type;
  final String token_type_hash;
  final String token_address;
  final int token_amount;
  final String nft_type_hash;
  final String nft_address;
  final int nft_count;
  final String create_date;
  final String update_date;
  MissionRewardInfo({
    required this.id,
    required this.misd_hash,
    required this.reward_type,
    required this.token_type_hash,
    required this.token_address,
    required this.token_amount,
    required this.nft_type_hash,
    required this.nft_address,
    required this.nft_count,
    required this.create_date,
    required this.update_date,
  });

  MissionRewardInfo copyWith({
    int? id,
    String? misd_hash,
    String? reward_type,
    String? token_type_hash,
    String? token_address,
    int? token_amount,
    String? nft_type_hash,
    String? nft_address,
    int? nft_count,
    String? create_date,
    String? update_date,
  }) {
    return MissionRewardInfo(
      id: id ?? this.id,
      misd_hash: misd_hash ?? this.misd_hash,
      reward_type: reward_type ?? this.reward_type,
      token_type_hash: token_type_hash ?? this.token_type_hash,
      token_address: token_address ?? this.token_address,
      token_amount: token_amount ?? this.token_amount,
      nft_type_hash: nft_type_hash ?? this.nft_type_hash,
      nft_address: nft_address ?? this.nft_address,
      nft_count: nft_count ?? this.nft_count,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'misd_hash': misd_hash,
      'reward_type': reward_type,
      'token_type_hash': token_type_hash,
      'token_address': token_address,
      'token_amount': token_amount,
      'nft_type_hash': nft_type_hash,
      'nft_address': nft_address,
      'nft_count': nft_count,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory MissionRewardInfo.fromMap(Map<String, dynamic> map) {
    return MissionRewardInfo(
      id: map['id'].toInt() as int,
      misd_hash: map['misd_hash'] as String,
      reward_type: map['reward_type'] as String,
      token_type_hash: map['token_type_hash'] as String,
      token_address: map['token_address'] as String,
      token_amount: map['token_amount'].toInt() as int,
      nft_type_hash: map['nft_type_hash'] as String,
      nft_address: map['nft_address'] as String,
      nft_count: map['nft_count'].toInt() as int,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MissionRewardInfo.fromJson(String source) => MissionRewardInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MissionRewardInfo(id: $id, misd_hash: $misd_hash, reward_type: $reward_type, token_type_hash: $token_type_hash, token_address: $token_address, token_amount: $token_amount, nft_type_hash: $nft_type_hash, nft_address: $nft_address, nft_count: $nft_count, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant MissionRewardInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.misd_hash == misd_hash &&
      other.reward_type == reward_type &&
      other.token_type_hash == token_type_hash &&
      other.token_address == token_address &&
      other.token_amount == token_amount &&
      other.nft_type_hash == nft_type_hash &&
      other.nft_address == nft_address &&
      other.nft_count == nft_count &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      misd_hash.hashCode ^
      reward_type.hashCode ^
      token_type_hash.hashCode ^
      token_address.hashCode ^
      token_amount.hashCode ^
      nft_type_hash.hashCode ^
      nft_address.hashCode ^
      nft_count.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}