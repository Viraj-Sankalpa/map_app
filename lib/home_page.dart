import 'package:flutter/material.dart';
import 'package:map_app/location_map.dart';
import 'package:map_app/user_input.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('- Home Page -', style: TextStyle(fontSize: 24,color: Colors.brown,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/map-icon.png',height: 400,width: 400,),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('See Live Location'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationMap()));
              },
            ),
            ElevatedButton(
              child: const Text('Input Lat & Lon'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}


