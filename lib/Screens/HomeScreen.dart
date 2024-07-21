import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scopefinalproject/Screens/Course.dart';
import 'package:scopefinalproject/Screens/login.dart';
import 'package:scopefinalproject/screens/about.dart';
import 'package:scopefinalproject/screens/contact.dart';
import 'package:scopefinalproject/Screens/profile.dart'; // Create this new screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Future<void> _viewProfile() async {
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(user: user!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text(
              'Scope India',
              style: TextStyle(color: Colors.white),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.blue[900], // Dark blue background for the whole drawer
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 100,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue[800], // Slightly lighter dark blue for the header
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          if (user != null) // Show profile icon only if user is logged in
                            PopupMenuButton<String>(
                              icon: Icon(Icons.account_circle, color: Colors.white),
                              onSelected: (String value) {
                                if (value == 'Logout') {
                                  _logout();
                                } else if (value == 'View Profile') {
                                  _viewProfile();
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem<String>(
                                    value: 'View Profile',
                                    child: Text('View Profile'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Logout',
                                    child: Text('Logout'),
                                  ),
                                ];
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.book, color: Colors.white),
                    title: Text('Courses', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseScreen()));
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text('Know About Us', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => about()), // Adjust screen name if needed
                      );
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.contact_mail, color: Colors.white),
                    title: Text('Contact', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactScreen()),
                      );
                    },
                  ),
                  if (user == null) // Show 'Sign In' only if user is not logged in
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      leading: Icon(Icons.app_registration, color: Colors.white),
                      title: Text('Sign In', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInScreen()),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/scope-india-logo-bird.png', // Replace with your image path
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'PROFESSIONALS oriented on-the-job TRAINING model. SCOPE INDIA provides courses for Software Programming in Python (Data Science | Artificial Intelligence | Machine Learning | Deep Learning, Data Analytics), Java, PHP, .Net, MERN, Software Testing Manual and Automation, Cloud Computing (AWS | Azure), Server Administration (MicroSoft MCSE | Linux RHCE), Networking (CCNA), DevOps, Mobile App Development in Flutter, and Digital Marketing. Training with a 100% Trusted Job-Based Internship Model. SCOPE INDIA has a Strong Placement Cell that provides jobs to thousands of students every year. We assure you, you won\'t regret it after training from SCOPE INDIA!\n\n'
                          'This is how SCOPE INDIA can support both newbies and experienced in the industry to upgrade their skills.',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 200,
                    color: Colors.blue,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/image1.png', // Replace with your image path
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/image2.png', // Replace with your image path
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/image3.png', // Replace with your image path
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/image4.png', // Replace with your image path
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
