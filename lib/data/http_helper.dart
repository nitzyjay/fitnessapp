import 'package:http/http.dart' as http;

class HttpHelper  {

  ///https://api.openweathermap.org/data/2.5/weather?q=London&appid=f358890a59676dcadce88c95ce302075

  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  String authority = 'google.com';
  //String authority = 'api.openweathermap.org';
  String apiKey = 'f358890a59676dcadce88c95ce302075';
  String path = 'data/2.5/weather';

  Future<String> getWeather(String location) async{
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}