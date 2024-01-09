import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'ATTENDANCE  MANAGER',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 59, 58, 58),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 142, 162, 253),
        centerTitle: true,
        elevation: 0,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 250,
              margin: EdgeInsets.only(top: 55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/employe.json',
                    width: 250,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 1),
                  Text(
                    "Login as Employee",
                    style: TextStyle(
                      fontSize: 24,
                       color:  Color.fromARGB(255, 59, 58, 58),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lemon'
                    ),
                  ),
                ],
              ),
            ),
           
            SizedBox(height: 35),
            Container(
             width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/admin.json',
                   width: 250,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Login as  Admin",
                    style: TextStyle(
                      fontSize: 24,
                      color:  Color.fromARGB(255, 59, 58, 58),
                      fontWeight: FontWeight.bold,
                       fontFamily: 'Lemon'
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
