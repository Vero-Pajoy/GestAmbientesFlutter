import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:g_ambientes/models/city.dart';

class Api{

  Dio _dio = Dio();

  Future<List<City>> getCityByName(String city) async{
    try{
      //Hacemos la petición
      final url = 'https://www.metaweather.com/api/location/search/?query='+city;

      final get = await _dio.get(url);

      if(get.statusCode == 200){

        final json = get.data[0];
        final city = City.fromJson(json);
        final res = get.data;
        final List<City> listCity = cityFromJson(json.decode(res));
        print('ko');
        listCity.add(city);
        return listCity;

      }else{
        print('Esto es una exception en la petición');
        return null;
      }

    }catch (exception){
      //Si falla, respondemos aquí
      print(exception);
      return null;
    }
  }

}