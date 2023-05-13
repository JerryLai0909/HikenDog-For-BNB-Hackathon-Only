import 'dart:convert';

class User {
  int? id;
  String? user_hash;
  String? user_name;
  String? user_email;
  String? user_pwd;
  int? token_count;
  int? nft_number;
  int? line_count;
  int? mission_count;
  String? user_level;
  int? is_web3;
  String? create_time;
  String? update_time;

  User({
    this.id,
    this.user_hash,
    this.user_name,
    this.user_email,
    this.user_pwd,
    this.token_count,
    this.nft_number,
    this.line_count,
    this.mission_count,
    this.user_level,
    this.is_web3,
    this.create_time,
    this.update_time,
  });

  User copyWith({
    int? id,
    String? user_hash,
    String? user_name,
    String? user_email,
    String? user_pwd,
    int? token_count,
    int? nft_number,
    int? line_count,
    int? mission_count,
    String? user_level,
    int? is_web3,
    String? create_time,
    String? update_time,
  }) {
    return User(
      id: id ?? this.id,
      user_hash: user_hash ?? this.user_hash,
      user_name: user_name ?? this.user_name,
      user_email: user_email ?? this.user_email,
      user_pwd: user_pwd ?? this.user_pwd,
      token_count: token_count ?? this.token_count,
      nft_number: nft_number ?? this.nft_number,
      line_count: line_count ?? this.line_count,
      mission_count: mission_count ?? this.mission_count,
      user_level: user_level ?? this.user_level,
      is_web3: is_web3 ?? this.is_web3,
      create_time: create_time ?? this.create_time,
      update_time: update_time ?? this.update_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_hash': user_hash,
      'user_name': user_name,
      'user_email': user_email,
      'user_pwd': user_pwd,
      'token_count': token_count,
      'nft_number': nft_number,
      'line_count': line_count,
      'mission_count': mission_count,
      'user_level': user_level,
      'is_web3': is_web3,
      'create_time': create_time,
      'update_time': update_time,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'].toInt() as int,
      user_hash: map['user_hash'] as String,
      user_name: map['user_name'] as String,
      user_email: map['user_email'] as String,
      user_pwd: map['user_pwd'] as String,
      token_count: map['token_count'].toInt() as int,
      nft_number: map['nft_number'].toInt() as int,
      line_count: map['line_count'].toInt() as int,
      mission_count: map['mission_count'].toInt() as int,
      user_level: map['user_level'] as String,
      is_web3: map['is_web3'].toInt() as int,
      create_time: map['create_time'] as String,
      update_time: map['update_time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, user_hash: $user_hash, user_name: $user_name, user_email: $user_email, user_pwd: $user_pwd, token_count: $token_count, nft_number: $nft_number, line_count: $line_count, mission_count: $mission_count, user_level: $user_level, is_web3: $is_web3, create_time: $create_time, update_time: $update_time)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_hash == user_hash &&
        other.user_name == user_name &&
        other.user_email == user_email &&
        other.user_pwd == user_pwd &&
        other.token_count == token_count &&
        other.nft_number == nft_number &&
        other.line_count == line_count &&
        other.mission_count == mission_count &&
        other.user_level == user_level &&
        other.is_web3 == is_web3 &&
        other.create_time == create_time &&
        other.update_time == update_time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_hash.hashCode ^
        user_name.hashCode ^
        user_email.hashCode ^
        user_pwd.hashCode ^
        token_count.hashCode ^
        nft_number.hashCode ^
        line_count.hashCode ^
        mission_count.hashCode ^
        user_level.hashCode ^
        is_web3.hashCode ^
        create_time.hashCode ^
        update_time.hashCode;
  }
}
