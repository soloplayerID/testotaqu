// ignore_for_file: avoid_print

part of 'resources.dart';

class DestinationServices {
  final Dio _dio = Dio();
  late Response res;

  Future<DestinationResponse> getDestination(String token) async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["authorization"] =
          "Bearer $token";
      res = await _dio.get('http://115.85.80.34:4100/destination');

      if (res.statusCode == 200) {
        print(res.data);
        DestinationResponse destinationResponse = DestinationResponse.fromJson(res.data);
        return destinationResponse;
      } else if(res.statusCode == 401) {
        print('woiiiiiiiii expired');
        return Future.error('woiiiiiiiii expired!');
      } else {
        return Future.error('Yah, Internet kamu error!');
      }
    } on DioError catch(e){
      print(e.toString());
      return Future.error('woiiiiiiiii expired!');
    } on SocketException {
      // print('No Internet connection 😑');
      return Future.error('No Internet connection 😑');
    } on HttpException {
      // print("Couldn't find the post 😱");
      return Future.error("ouldn't find the post 😱");
    } on FormatException {
      // print("Bad response format 👎");
      return Future.error("Bad response format 👎");
    }
  }

  static Future<List<Map<String, dynamic>>> getSuggestions(String query) async {
    print('go search$query');
    if (query.isEmpty && query.length < 2) {
      print('Query needs to be at least 2 chars');
      return Future.value([]);
    }

    List<Destination>? jsons = await DestinationDatabase.instance.read(query);
    print(jsons.length);

    return Future.value(jsons
        .map((e) => {'id': e.id,'name': e.name, 'typeName': e.typeName.toString()})
        .toList());

    
  }

  Future<AvailResponse> getAvail(String token) async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["authorization"] = "Bearer $token";
      res = await _dio.post('http://115.85.80.34:4100/avail',
          data: {
        "type_source": "location",
        "type_id": 3,
        "destination_id": 1270,
        "min_price": 0,
        "max_price": 10000000000,
        "page": 1,
        "order_by": "lowest",
        "reference": "search"
      });

      if (res.statusCode == 200) {
        print(res.data);
        AvailResponse availResponse =
            AvailResponse.fromJson(res.data);
        return availResponse;
      } else if (res.statusCode == 401) {
        print('woiiiiiiiii expired');
        return Future.error('woiiiiiiiii expired!');
      } else {
        return Future.error('Yah, Internet kamu error!');
      }
    } on DioError catch (e) {
      print(e.toString());
      return Future.error('woiiiiiiiii expired!');
    } on SocketException {
      // print('No Internet connection 😑');
      return Future.error('No Internet connection 😑');
    } on HttpException {
      // print("Couldn't find the post 😱");
      return Future.error("Couldn't find the post 😱");
    } on FormatException {
      // print("Bad response format 👎");
      return Future.error("Bad response format 👎");
    }
  }

}
