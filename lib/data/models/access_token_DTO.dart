// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

class AccessTokenDTO {
  bool? success;
  Data? data;
  String? message;
  String? timestamp;

  AccessTokenDTO({this.success, this.data, this.message, this.timestamp});

  AccessTokenDTO.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  static List<AccessTokenDTO> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AccessTokenDTO.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["message"] = message;
    _data["timestamp"] = timestamp;
    return _data;
  }

  AccessTokenDTO copyWith({
    bool? success,
    Data? data,
    String? message,
    String? timestamp,
  }) =>
      AccessTokenDTO(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        timestamp: timestamp ?? this.timestamp,
      );
}

class Data {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;

  Data(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.expiresIn,
      this.scope});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["access_token"] is String) {
      accessToken = json["access_token"];
    }
    if (json["token_type"] is String) {
      tokenType = json["token_type"];
    }
    if (json["refresh_token"] is String) {
      refreshToken = json["refresh_token"];
    }
    if (json["expires_in"] is int) {
      expiresIn = json["expires_in"];
    }
    if (json["scope"] is String) {
      scope = json["scope"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["token_type"] = tokenType;
    _data["refresh_token"] = refreshToken;
    _data["expires_in"] = expiresIn;
    _data["scope"] = scope;
    return _data;
  }

  Data copyWith({
    String? accessToken,
    String? tokenType,
    String? refreshToken,
    int? expiresIn,
    String? scope,
  }) =>
      Data(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        refreshToken: refreshToken ?? this.refreshToken,
        expiresIn: expiresIn ?? this.expiresIn,
        scope: scope ?? this.scope,
      );
}
