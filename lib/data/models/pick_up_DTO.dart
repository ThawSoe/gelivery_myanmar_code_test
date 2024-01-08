// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

class PickUpListDTO {
  bool? success;
  Data? data;
  String? message;

  PickUpListDTO({this.success, this.data, this.message});

  PickUpListDTO.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  static List<PickUpListDTO> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PickUpListDTO.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["message"] = message;
    return _data;
  }

  PickUpListDTO copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      PickUpListDTO(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );
}

class Data {
  List<Items>? items;
  int? totalRecords;

  Data({this.items, this.totalRecords});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["items"] is List) {
      items = json["items"] == null
          ? null
          : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    if (json["totalRecords"] is int) {
      totalRecords = json["totalRecords"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["totalRecords"] = totalRecords;
    return _data;
  }

  Data copyWith({
    List<Items>? items,
    int? totalRecords,
  }) =>
      Data(
        items: items ?? this.items,
        totalRecords: totalRecords ?? this.totalRecords,
      );
}

class Items {
  String? trackingId;
  String? osName;
  String? pickupDate;
  String? osPrimaryPhone;
  String? osTownshipName;
  int? totalWays;

  Items(
      {this.trackingId,
      this.osName,
      this.pickupDate,
      this.osPrimaryPhone,
      this.osTownshipName,
      this.totalWays});

  Items.fromJson(Map<String, dynamic> json) {
    if (json["trackingId"] is String) {
      trackingId = json["trackingId"];
    }
    if (json["osName"] is String) {
      osName = json["osName"];
    }
    if (json["pickupDate"] is String) {
      pickupDate = json["pickupDate"];
    }
    if (json["osPrimaryPhone"] is String) {
      osPrimaryPhone = json["osPrimaryPhone"];
    }
    if (json["osTownshipName"] is String) {
      osTownshipName = json["osTownshipName"];
    }
    if (json["totalWays"] is int) {
      totalWays = json["totalWays"];
    }
  }

  static List<Items> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Items.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["trackingId"] = trackingId;
    _data["osName"] = osName;
    _data["pickupDate"] = pickupDate;
    _data["osPrimaryPhone"] = osPrimaryPhone;
    _data["osTownshipName"] = osTownshipName;
    _data["totalWays"] = totalWays;
    return _data;
  }

  Items copyWith({
    String? trackingId,
    String? osName,
    String? pickupDate,
    String? osPrimaryPhone,
    String? osTownshipName,
    int? totalWays,
  }) =>
      Items(
        trackingId: trackingId ?? this.trackingId,
        osName: osName ?? this.osName,
        pickupDate: pickupDate ?? this.pickupDate,
        osPrimaryPhone: osPrimaryPhone ?? this.osPrimaryPhone,
        osTownshipName: osTownshipName ?? this.osTownshipName,
        totalWays: totalWays ?? this.totalWays,
      );
}
