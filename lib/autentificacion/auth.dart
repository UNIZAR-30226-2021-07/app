import 'package:http/http.dart' as http;

class AuthService {

  Future<dynamic> login(String email, String password) async {
    //http.Response res = await http.get(
    //    Uri.http("gatovid.herokuapp.com/data", "/login", { "email" : "$email" , "password" : "$password"}));

    String parameters = "email=$email&password=$password";
    print(parameters);

    //{'name': '$email', 'password': '$password'}

    //No consigo hacer de momento las peticiones con post
    //var res = await http.post(Uri.parse("http://gatovid.herokuapp.com/data/login?"), body: parameters );

    String request  = "http://gatovid.herokuapp.com/data/login?$parameters";
    print(request);

    var res = await http.get(Uri.parse(request));
    print(res.statusCode);
    print(res.body);
    return res;

  }

  Future<dynamic> logout() async {
    //http.Response res = await http.get(
    //    Uri.http("gatovid.herokuapp.com/data", "/login", { "email" : "$email" , "password" : "$password"}));

    String token = "";

    Map <String, String>  header = {
      "Authorization" : "Bearer $token"
    };

    var res = await http.get(Uri.parse("http://gatovid.herokuapp.com/data/logout"), headers: header);
    print(res.body);
    return res;
  }

}