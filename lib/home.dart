import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  static String country = '';

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(179, 10, 0, 119),
        title: const Text('University'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/img3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Center(
             child: TextField(
                onChanged: (data) {
                  MyHome.country = data;
                },
                decoration: InputDecoration(
                  hintText: 'Country Name',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 66, 66),
                    ),
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  ),
              ),
           ),
            SizedBox(height: 20,),
            Material(
              elevation: 5,
              color: Color.fromARGB(179, 48, 33, 255),
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'results');
                },
                child: Text('Search', 
                style: TextStyle(color: Colors.white),),
                ),
            )

          ],
        ),
      ),
    );
  }
}