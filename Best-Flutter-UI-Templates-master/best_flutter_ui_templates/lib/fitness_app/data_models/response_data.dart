class ResponseData<T> {
  int code;
  String msg;
  T data;
  ResponseData({required this.code, required this.msg, required this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      code: json['code'],
      msg: json['msg'],
      data: json['data'],
    );
  }
}
