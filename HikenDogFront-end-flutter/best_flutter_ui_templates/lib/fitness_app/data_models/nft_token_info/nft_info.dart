import 'dart:convert';

class NFTInfo {
  final int id;
  final String nft_hash;
  final String nft_type;
  final String nft_address;
  final int nft_token_cost;
  final int nft_fragment_require;
  final String nft_uri_path;
  final String nft_uri_background;
  final String create_date;
  final String update_date;
  NFTInfo({
    required this.id,
    required this.nft_hash,
    required this.nft_type,
    required this.nft_address,
    required this.nft_token_cost,
    required this.nft_fragment_require,
    required this.nft_uri_path,
    required this.nft_uri_background,
    required this.create_date,
    required this.update_date,
  });

  NFTInfo copyWith({
    int? id,
    String? nft_hash,
    String? nft_type,
    String? nft_address,
    int? nft_token_cost,
    int? nft_fragment_require,
    String? nft_uri_path,
    String? nft_uri_background,
    String? create_date,
    String? update_date,
  }) {
    return NFTInfo(
      id: id ?? this.id,
      nft_hash: nft_hash ?? this.nft_hash,
      nft_type: nft_type ?? this.nft_type,
      nft_address: nft_address ?? this.nft_address,
      nft_token_cost: nft_token_cost ?? this.nft_token_cost,
      nft_fragment_require: nft_fragment_require ?? this.nft_fragment_require,
      nft_uri_path: nft_uri_path ?? this.nft_uri_path,
      nft_uri_background: nft_uri_background ?? this.nft_uri_background,
      create_date: create_date ?? this.create_date,
      update_date: update_date ?? this.update_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nft_hash': nft_hash,
      'nft_type': nft_type,
      'nft_address': nft_address,
      'nft_token_cost': nft_token_cost,
      'nft_fragment_require': nft_fragment_require,
      'nft_uri_path': nft_uri_path,
      'nft_uri_background': nft_uri_background,
      'create_date': create_date,
      'update_date': update_date,
    };
  }

  factory NFTInfo.fromMap(Map<String, dynamic> map) {
    return NFTInfo(
      id: map['id'].toInt() as int,
      nft_hash: map['nft_hash'] as String,
      nft_type: map['nft_type'] as String,
      nft_address: map['nft_address'] as String,
      nft_token_cost: map['nft_token_cost'].toInt() as int,
      nft_fragment_require: map['nft_fragment_require'].toInt() as int,
      nft_uri_path: map['nft_uri_path'] as String,
      nft_uri_background: map['nft_uri_background'] as String,
      create_date: map['create_date'] as String,
      update_date: map['update_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NFTInfo.fromJson(String source) => NFTInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NFTInfo(id: $id, nft_hash: $nft_hash, nft_type: $nft_type, nft_address: $nft_address, nft_token_cost: $nft_token_cost, nft_fragment_require: $nft_fragment_require, nft_uri_path: $nft_uri_path, nft_uri_background: $nft_uri_background, create_date: $create_date, update_date: $update_date)';
  }

  @override
  bool operator ==(covariant NFTInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nft_hash == nft_hash &&
      other.nft_type == nft_type &&
      other.nft_address == nft_address &&
      other.nft_token_cost == nft_token_cost &&
      other.nft_fragment_require == nft_fragment_require &&
      other.nft_uri_path == nft_uri_path &&
      other.nft_uri_background == nft_uri_background &&
      other.create_date == create_date &&
      other.update_date == update_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nft_hash.hashCode ^
      nft_type.hashCode ^
      nft_address.hashCode ^
      nft_token_cost.hashCode ^
      nft_fragment_require.hashCode ^
      nft_uri_path.hashCode ^
      nft_uri_background.hashCode ^
      create_date.hashCode ^
      update_date.hashCode;
  }
}