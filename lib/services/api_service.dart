import 'package:dio/dio.dart';

const apiKey = '?api-key=G0avyhSC87YmjG8sk0GiEWIspZvBIZAl';
const mostPopularUrl = 'https://api.nytimes.com/svc/mostpopular/v2/';

class ApiService {
  Dio dio = Dio();

  Future fetchMostEmailed(int days) async {
    var url = '${mostPopularUrl}emailed/$days.json$apiKey';
    try {
      var response = await dio.get(url);
      return Future.value(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future fetchFacebookArticles(int days) async {
    var url = '${mostPopularUrl}shared/$days/facebook.json$apiKey';
    try {
      var response = await dio.get(url);
      return Future.value(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future fetchMostShared(int days) async {
    var url = '${mostPopularUrl}viewed/$days.json$apiKey';
    try {
      var response = await dio.get(url);
      return Future.value(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }
}
