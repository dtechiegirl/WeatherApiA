import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  // const SelectCityPage({super.key});
  static route()=> MaterialPageRoute(builder: (context){

    return SettingsPage();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settigns"),
      ),
      body: Container(

      ),
    );
  }
}
