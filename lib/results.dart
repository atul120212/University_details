import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class MyResult extends StatefulWidget {
  const MyResult({super.key});

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {


  var session=[];
  var country='';

  var ListC=0;

  @override
  void initState() {
    print('Result Page opened');
    country = MyHome.country;
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    var url = Uri.parse('http://universities.hipolabs.com/search?country=$country');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      session = jsonDecode(response.body);
      print(session);
      setState(() {
        ListC = session.length;
      });
      return session;
    } else {
      throw Exception('Failed to load country data');
    }

  }

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
            image: AssetImage('images/img4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: ListC,
          itemBuilder: (BuildContext contex, int index){
          return Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            height: 200,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Card(
                color: Color.fromARGB(255, 93, 82, 252).withOpacity(0.7),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),

                ),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(session[index]['country'] ?? 'No Country Mentioned',
                    
                    style: GoogleFonts.lato().copyWith(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      session[index]['alpha_two_code'] ?? 'No Code Mentioned',
                    style: GoogleFonts.lato().copyWith(
                          color: Color.fromARGB(255, 13, 13, 13),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),),
                        SizedBox(height: 15,),
                    Text(
                      session[index]['name'] ?? 'No Name Mentioned',
                      style: GoogleFonts.lato().copyWith(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10,),
                  //  Text(session[index]['domains'] ?? 'No Domain Mentioned'),
                  //  Text(session[index]['web_pages'] ?? 'No Web Page Mentioned'.toString()),
                    Text(
                      session[index]['state-province'] ?? 'No State Mentioned',
                      style: GoogleFonts.lato().copyWith(
                          color: Color.fromARGB(255, 200, 248, 242),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}