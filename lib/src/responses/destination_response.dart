class DestinationResponse {
  int? code;
  bool? status;
  String? message;
  List<Data>? data;

  DestinationResponse({this.code, this.status, this.message, this.data});

  DestinationResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? destinationId;
  String? typeSource;
  String? typeName;
  String? name;
  int? packageTypeId;

  Data(
      {this.destinationId,
      this.typeSource,
      this.typeName,
      this.name,
      this.packageTypeId});

  Data.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    typeSource = json['type_source'];
    typeName = json['type_name'];
    name = json['name'];
    packageTypeId = json['package_type_id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['type_source'] = typeSource;
    data['type_name'] = typeName;
    data['name'] = name;
    data['package_type_id'] = packageTypeId;
    return data;
  }
}
