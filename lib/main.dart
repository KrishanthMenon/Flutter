import 'package:weather_app/data_service.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Wetter App'),
            backgroundColor: Colors.green[600],
            //centerTitle: true,
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(
                    children: [
                    ],
                  ),
                Text('Hello! 👋',style: TextStyle(fontSize: 17),
        ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
                Text('Zeig mir das Wetter in',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        //decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                ),
                Text(
                  'Aktuell sind es ${_response.tempInfo.temperature} Grad. (°F)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
                ElevatedButton(onPressed: _search, child: Text('Suchen'), style: TextButton.styleFrom(
                  backgroundColor: Colors.green, // Text Color
                ),)
              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}