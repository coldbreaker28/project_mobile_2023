import 'package:flutter/material.dart';
import 'package:test1/pages/login.dart';
import 'package:test1/services/firebase_sign_in.dart';

class Profile extends StatefulWidget{
    const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile>  with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = 
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.lightBlue],
          )
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 60,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 40),
            const Text('Nama: ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber)),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            Text(
              email,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }), ModalRoute.withName('/'),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: const EdgeInsets.all(8.0),
              ),
              child: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }
  
}