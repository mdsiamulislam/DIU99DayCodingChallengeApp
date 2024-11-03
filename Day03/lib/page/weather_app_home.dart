import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../widget/add_info.dart';
import '../widget/forecast.dart';

class WeatherAppHome extends StatefulWidget {
  const WeatherAppHome({super.key});

  @override
  State<WeatherAppHome> createState() => _WeatherAppHomeState();
}

class _WeatherAppHomeState extends State<WeatherAppHome> {
  Future<Map<String, dynamic>>? weather;
  final TextEditingController _cityController = TextEditingController();
  String cityName = 'Dhaka';

  Future<Map<String, dynamic>> getCurrentWeather(String city) async {
    try {
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=72cdfd737c791dc741025bd55f00bc0d'));
      final data = jsonDecode(res.body);

      if (data['cod'] == '200') {
        return data;
      } else {
        throw ('Error: ${data['message']}');
      }
    } catch (e) {
      return {}; // Return an empty map in case of an error
    }
  }

  Future<void> _getCityName() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      setState(() {
        cityName = placemarks.first.locality!;
        weather = getCurrentWeather(cityName); // Refresh weather data for the current location
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather(cityName);
    _getCityName();
  }

  void _updateWeather() {
    setState(() {
      cityName = _cityController.text.isNotEmpty ? _cityController.text : cityName;
      weather = getCurrentWeather(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: _getCityName, // Refresh weather based on current location
          icon: const Icon(Icons.location_on_outlined),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _updateWeather,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<Map<String, dynamic>>(
                future: weather,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Error fetching weather data.'),
                    );
                  }

                  final data = snapshot.data!;
                  final urlShort = data['list'][0];
                  final temp = urlShort['main']['temp'];
                  final tempInC = (temp - 273.15).toStringAsFixed(2);
                  final weatherSky = urlShort['weather'][0]['main'];
                  final humidity = urlShort['main']['humidity'];
                  final pressure = urlShort['main']['pressure'];
                  final windSpeed = urlShort['wind']['speed'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                '$tempInC °C',
                                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                weatherSky == 'Clouds'
                                    ? Icons.cloud
                                    : weatherSky == 'Rain'
                                    ? Icons.water_drop
                                    : weatherSky == 'Clear'
                                    ? Icons.wb_sunny
                                    : Icons.cloud_circle,
                                size: 50,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                weatherSky,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Current weather in $cityName',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Weather Forecast for $cityName',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          itemCount: 16,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = data['list'][index + 1];
                            final icon = item['weather'][0]['main'];
                            final time = DateTime.parse(item['dt_txt']);
                            return Forecast(
                              iconData: icon == 'Clouds'
                                  ? Icons.cloud
                                  : icon == 'Rain'
                                  ? Icons.water_drop
                                  : icon == 'Clear'
                                  ? Icons.wb_sunny
                                  : Icons.cloud_circle,
                              label: DateFormat.jm().format(time),
                              valul: (item['main']['temp'] - 273.15).toStringAsFixed(2),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Additional Information for $cityName',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AddInfo(
                              icon: Icons.water_drop,
                              label: 'Humidity',
                              value: '$humidity%',
                            ),
                            AddInfo(
                              icon: Icons.wind_power,
                              label: 'Wind Speed',
                              value: '$windSpeed m/s',
                            ),
                            AddInfo(
                              icon: Icons.beach_access,
                              label: 'Pressure',
                              value: '$pressure hPa',
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: 'Enter City Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.location_city),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _updateWeather,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
