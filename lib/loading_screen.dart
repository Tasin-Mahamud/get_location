import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void reuest_permit() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print("location permission denied by user :)");
    } else if (permission == LocationPermission.deniedForever) {
      print("DENIED FOREVER BY USER :)");
    } else {
      print(await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            reuest_permit();
          },
          color: Colors.lightBlueAccent,
          child: Text("Get Location"),
        ),
      ),
    );
  }
}
