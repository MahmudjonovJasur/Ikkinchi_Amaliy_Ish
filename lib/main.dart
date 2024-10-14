import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 210, 238, 110),
          title: Center(
            child: Text(
              'My Application',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        body: Center(child: DropdownExample()),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? selectedValue;

  // Navigator orqali tanlangan sahifaga o'tamiz
  void _navigateToPage(String value) {
    switch (value) {
      case 'Birinchi':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstPage()),
        );
        break;
      case 'Ikkinchi':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        );
        break;
      case 'Uchinchi':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThirdPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.green, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              'Tanlang',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            value: selectedValue,
            icon: Icon(Icons.arrow_drop_down, color: Colors.green),
            iconSize: 30,
            isExpanded: true,
            style: TextStyle(color: Colors.black, fontSize: 18),
            items: <String>['Birinchi', 'Ikkinchi', 'Uchinchi']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
                if (newValue != null) {
                  _navigateToPage(newValue); // Sahifaga o'tish
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

// Birinchi Sahifa
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birinchi Sahifa'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Bu Birinchi Sahifa',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Ikkinchi Sahifa
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ikkinchi Sahifa'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Bu Ikkinchi Sahifa',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Uchinchi Sahifa
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uchinchi Sahifa'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Bu Uchinchi Sahifa',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
