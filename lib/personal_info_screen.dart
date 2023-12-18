import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Information"),
      ),
      body: Container(
        color: Colors.black, // Set the background color to black
        padding: EdgeInsets.all(70), // Add padding for spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add your personal information here as Text widgets in a Column
            _buildInfoText("Name: Shyla Jhane A. Caparros"),
            _buildInfoText("Age: 20 years old"),
            _buildInfoText("Address: Baug Urbiztondo Pangasinan"),
            _buildInfoText("Date of Birth: January 25, 2003"),
            _buildInfoText("Place of Birth: San Carlos City"),
            _buildInfoText("Sex: Female"),
            _buildInfoText("Citizenship: Filipino"),
            _buildInfoText("Civil Status: Single"),
            _buildInfoText("Religion: Roman Catholic"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromARGB(255, 2, 107, 46), // Set the text color to yellow
          fontSize: 16, // Set the font size
          fontWeight: FontWeight.bold, // Set the font weight to bold
          fontStyle: FontStyle.italic, // Set the font style to italic
        ),
      ),
    );
  }
}
