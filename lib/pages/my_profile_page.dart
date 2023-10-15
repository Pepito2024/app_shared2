import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String fullName = "";
  String address = "";

  @override
  void initState() {
    super.initState();
    getDataShared();
  }

  getDataShared() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    fullName = _prefs.getString("fullName") ?? "x";
    address = _prefs.getString("address")?? "x";

    setState(() {});
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Mi Información",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(fullName),
              subtitle: Text("Nombre completo"),
            ),
            ListTile(
               leading: Icon(Icons.location_on),
              title: Text(address),
              subtitle: Text("Dirección de vivienda actual"),
            ),
          ],
        ),
      ),
    );
  }
}
