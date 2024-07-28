import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_login_model.dart';
import '../model/user_model.dart';
class Repository{
  Future<LoginModel?> sendData(String email , String password) async{
    try{
      var url = Uri.parse('https://reqres.in/api/login');
    var response = await http.post(url,
        body: {
           "email": email, "password": password
    });
    if(response.statusCode == 200){

      print(response.body);
      return LoginModel.fromJson(jsonDecode(response.body));
    }
else{
  throw Exception('faild to login');
    }

    }catch(e){
      print(e);
    }
  }
  Future<UserModel?> getData() async{
    try{
      var url = Uri.parse('https://reqres.in/api/users');
      var response = await http.get(url);
      if(response.statusCode == 200){
        return UserModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
  }
}