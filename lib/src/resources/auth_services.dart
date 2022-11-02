// ignore_for_file: avoid_print

part of 'resources.dart';

class AuthServices {
  final Dio _dio = Dio();
  late Response res;
  
  Future<LoginResponse> login(String username, String password) async {
    try {
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMTUuODUuODAuMzRcL3V0aWxpemF0aW9uXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjY3MDQwNDg1LCJleHAiOjE2NjcwNDQwODUsIm5iZiI6MTY2NzA0MDQ4NSwianRpIjoiNjBQUzYzNWtJRjJERDdRcyIsInN1YiI6NTYsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.x2HcIzf0tFSxDTfFZuaVt368QT8NOHtL7gBtU2-dxgc";
      res = await _dio.post('http://115.85.80.34/utilization/api/auth/login', data: {'username': username, 'password': password});

      if(res.statusCode == 200) {
        print(res.data);
        LoginResponse loginResponse = LoginResponse.fromJson(res.data);
        return loginResponse;
      }else{
        return Future.error('Yah, Internet kamu error!');
      }
      
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
}