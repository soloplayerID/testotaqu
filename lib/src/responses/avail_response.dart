class AvailResponse {
  int? code;
  bool? status;
  String? message;
  Data? data;

  AvailResponse({this.code, this.status, this.message, this.data});

  AvailResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalPage;
  int? currentPage;
  List<Packages>? packages;

  Data({this.totalPage, this.currentPage, this.packages});

  Data.fromJson(Map<String, dynamic> json) {
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_page'] = totalPage;
    data['current_page'] = currentPage;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? packageId;
  String? name;
  int? price;
  String? currency;
  int? day;
  String? operationTimeIn;
  String? operationTimeOut;
  String? timeZone;
  List<String>? images;
  int? packageTypeId;
  String? packageTypeName;
  bool? isInstallment;
  List<Destinations>? destinations;

  Packages(
      {this.packageId,
      this.name,
      this.price,
      this.currency,
      this.day,
      this.operationTimeIn,
      this.operationTimeOut,
      this.timeZone,
      this.images,
      this.packageTypeId,
      this.packageTypeName,
      this.isInstallment,
      this.destinations});

  Packages.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'];
    day = json['day'];
    operationTimeIn = json['operation_time_in'];
    operationTimeOut = json['operation_time_out'];
    timeZone = json['time_zone'];
    images = json['images'].cast<String>();
    packageTypeId = json['package_type_id'];
    packageTypeName = json['package_type_name'];
    isInstallment = json['is_installment'];
    if (json['destinations'] != null) {
      destinations = <Destinations>[];
      json['destinations'].forEach((v) {
        destinations!.add(Destinations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['package_id'] = packageId;
    data['name'] = name;
    data['price'] = price;
    data['currency'] = currency;
    data['day'] = day;
    data['operation_time_in'] = operationTimeIn;
    data['operation_time_out'] = operationTimeOut;
    data['time_zone'] = timeZone;
    data['images'] = images;
    data['package_type_id'] = packageTypeId;
    data['package_type_name'] = packageTypeName;
    data['is_installment'] = isInstallment;
    if (destinations != null) {
      data['destinations'] = destinations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destinations {
  int? destinationId;
  String? name;

  Destinations({this.destinationId, this.name});

  Destinations.fromJson(Map<String, dynamic> json) {
    destinationId = json['destination_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_id'] = destinationId;
    data['name'] = name;
    return data;
  }
}
