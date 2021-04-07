import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_ambientes/bloc/respuestaApi/respuesta_api_bloc.dart';
import 'package:g_ambientes/models/city.dart';

import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class RespuestaApiUi extends StatefulWidget {
  static final nombrePagina = "Clima";

  @override
  _RespuestaApiUiState createState() => _RespuestaApiUiState();
}

class _RespuestaApiUiState extends State<RespuestaApiUi> {
  int temperature;
  var minTemperatureForecast = new List(7);
  var maxTemperatureForecast = new List(7);
  String location = '';
  int woeid = 2487956;
  String weather = 'clear';
  String abbreviation = '';
  var abbreviationForecast = new List(7);
  String errorMessage = '';
  Position _currentPosition;

  final Geolocator geolocator = Geolocator();

  String _currentAddress;

  String searchApiUrl =
      'https://www.metaweather.com/api/location/search/?query=';
  String locationApiUrl = 'https://www.metaweather.com/api/location/';

  initState() {
    super.initState();
    fetchLocation();
    fetchLocationDay();
  }

  //FetchSearch--> Ir a buscar
  void fetchSearch(String input) async {
    try {
      var searchResult = await http.get(searchApiUrl + input);
      var result = json.decode(searchResult.body)[0];

      setState(() {
        location = result["title"];
        woeid = result["woeid"];
        errorMessage = '';
      });
    } catch (error) {
      setState(() {
        errorMessage =
            "Lo sentimos no tenemos datos de esta ciudad. Prueba otra.";
      });
    }
  }

  void fetchLocation() async {
    var locationResult = await http.get(locationApiUrl + woeid.toString());
    var result = json.decode(locationResult.body);
    var consolidated_weather = result["consolidated_weather"];
    var data = consolidated_weather[0];

    setState(() {
      temperature = data["the_temp"].round();
      weather = data["weather_state_name"].replaceAll(' ', '').toLowerCase();
      abbreviation = data["weather_state_abbr"];
    });
  }

  void fetchLocationDay() async {
    var today = new DateTime.now();
    for (var i = 0; i < 7; i++) {
      var locationDayResult = await http.get(locationApiUrl +
          woeid.toString() +
          '/' +
          new DateFormat('y/M/d')
              .format(today.add(new Duration(days: i + 1)))
              .toString());
      var result = json.decode(locationDayResult.body);
      var data = result[0];

      setState(() {
        minTemperatureForecast[i] = data["min_temp"].round();
        maxTemperatureForecast[i] = data["max_temp"].round();
        abbreviationForecast[i] = data["weather_state_abbr"];
      });
    }
  }

  void onTextFieldSubmitted(String input) async {
    await fetchSearch(input);
    await fetchLocation();
    await fetchLocationDay();
  }

  _getCurrentLocation() async {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position){
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });

      onTextFieldSubmitted(place.locality);
      print(place.locality);
    } catch (e) {
      print(e);
    }
  }

  RespuestaApiBloc apiBloc;
  City city = City();
  List<City> listCity = List();

  TextEditingController textController;
  @override
  //void initState() {
  //textController = TextEditingController();
  //apiBloc = BlocProvider.of<RespuestaApiBloc>(context);
  //super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return temperature == null
        ? Center(
            child: CircularProgressIndicator())
        : Scaffold(
      extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(''),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () => _getCurrentLocation(),
                    child: Icon(
                      Icons.location_city,
                      size: 36.0,
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/clear.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Image.network(
                              'https://www.metaweather.com/static/img/weather/png/' +
                                  abbreviation +
                                  '.png',
                              width: 100,
                            ),
                          ),
                          Center(
                            child: Text(
                              temperature.toString() + '°C',
                              style: TextStyle(color: Colors.white, fontSize: 70.0),
                            ),
                          ),
                          Center(
                            child: Text(
                              location,
                              style: TextStyle(color: Colors.white, fontSize: 40.0),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                for (var i = 0; i < 7; i++)
                                  forecastElement(
                                      i + 1,
                                      abbreviationForecast[i],
                                      minTemperatureForecast[i],
                                      maxTemperatureForecast[i]),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 300,
                                child: TextField(
                                  onSubmitted: (String input) {
                                    onTextFieldSubmitted(input);
                                  },
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 25),
                                  decoration: InputDecoration(
                                    hintText: 'Buscar una ciudad...',
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 32.0, left: 32.0),
                                child: Text(errorMessage,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize:
                                        Platform.isAndroid ? 15.0 : 20.0)),
                              )
                            ],
                          ),
                          /*BlocListener<RespuestaApiBloc, RespuestaApiState>(
                      listener: (context, state){
                        if(state is ResApiSuccessGetCityByNameState){
                          print(state.props.first);
                          listCity = state.props.first;
                        }
                        if(state is ResApiFailureGetCityByNameState){
                          print(state.props.first);
                        }
                      },
                      child: BlocBuilder<RespuestaApiBloc, RespuestaApiState>(
                        builder: (context, state){
                          return Center(
                            child: Column(
                              children: [
                                TextField(controller: textController,),
                                FlatButton(
                                    onPressed: (){
                                      print(textController.text);
                                      apiBloc.add(ResApiGetCityByNameEvent(city: textController.text));
                                    },
                                    child: BlocBuilder<RespuestaApiBloc, RespuestaApiState>(
                                      builder: (context, state){
                                        if(state is ResApiLoadingState)
                                          return CircularProgressIndicator();
                                        else if(state is ResApiSuccessGetCityByNameState) {
                                          listCity = state.props.first;
                                          city = listCity.first;
                                          return Center(
                                            child: city.title != null ? Text(city.title) : Text(
                                                'city'),
                                          );
                                        }
                                        else
                                          return Column(
                                            children: [
                                              Container(
                                                  width: size.width*0.8,
                                                  color: Colors.blueAccent,
                                                  child: Center(child: Text('Enviar')),
                                              ),

                                              // city.title == null ?
                                              // Text(city.title) : null,
                                            ],
                                          );
                                      },
                                    )
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),*/
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

Widget forecastElement(
    daysFromNow, abbreviation, minTemperature, maxTemperature) {
  var now = new DateTime.now();
  var oneDayFromNow = now.add(new Duration(days: daysFromNow));
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(205, 212, 228, 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              new DateFormat.E().format(oneDayFromNow),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Text(
              new DateFormat.MMMd().format(oneDayFromNow),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Image.network(
                'https://www.metaweather.com/static/img/weather/png/' +
                    abbreviation +
                    '.png',
                width: 50,
              ),
            ),
            Text(
              'High: ' + maxTemperature.toString() + ' °C',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              'Low: ' + minTemperature.toString() + ' °C',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
    ),
  );
}
