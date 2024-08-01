import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scopefinalproject/Screens/Course.dart';
import 'package:scopefinalproject/Screens/login.dart';
import 'package:scopefinalproject/Screens/placement.dart';
import 'package:scopefinalproject/Screens/signup.dart';
import 'package:scopefinalproject/screens/about.dart';
import 'package:scopefinalproject/screens/contact.dart';
import 'package:scopefinalproject/Screens/profile.dart'; // Create this new screen
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scopefinalproject/reuseablewidgets/reusabel-widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _controller;

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
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue[900],
            title: Center(
              child: Image.asset(
                'images/scope-india-logo-bird.png',
                height: 60,
              ),
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/homescreenbg.jpeg'),
                      fit: BoxFit.cover)),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 70,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
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
                          if (user !=
                              null) // Show profile icon only if user is logged in
                            PopupMenuButton<String>(
                              icon: Icon(Icons.account_circle,
                                  color: Colors.white),
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
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.home_filled, color: Colors.white),
                    title:
                    Text('Home', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.book, color: Colors.white),
                    title:
                        Text('Courses', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CourseScreen()));
                    },
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text('Know About Us',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                about()), // Adjust screen name if needed
                      );
                    },
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text('Placements',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RecentPlacementsScreen()), // Adjust screen name if needed
                      );
                    },
                  ),
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Icon(Icons.contact_mail, color: Colors.white),
                    title:
                        Text('Contact', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactScreen()),
                      );
                    },
                  ),
                  if (user ==
                      null) // Show 'Sign In' only if user is not logged in
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      leading:
                          Icon(Icons.app_registration, color: Colors.white),
                      title: Text('Sign In',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/homescreenbg.jpeg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/scopeindia-title.png',
                              height: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          'Center for Software,Networking,& Cloud Education',
                          style: GoogleFonts.viga(
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        )),
                        SizedBox(
                          height: 50,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 300.0,
                            // Set to the desired height
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            // Adjust if needed
                            viewportFraction: 1.0,
                            // Ensures the item takes up the full width
                            enableInfiniteScroll: true,
                            scrollPhysics:
                                BouncingScrollPhysics(), // Optional: Bounce effect
                          ),
                          items: [
                            'images/Devops-training-scopeindia.jpg',
                            'images/scope-india-azure-certification-course.jpg',
                            'images/scope-india-digital-marketing-course.jpg',
                            'images/scope-india-dotnet-core-full-stack-course.jpg',
                            'images/scope-india-full-stack-intermediate-offer-sep2022-2 (1).jpg',
                            'images/scope-india-java-full-stack-course (1).jpg',
                            'images/scope-india-mean-mern-stack-course.jpg',
                            'images/scope-india-python-full-stack-course (1).jpg'
                          ].map((assetpath) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CourseScreen()),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    assetpath,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        400.0, // Match this to the height of the CarouselSlider
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'SCOPE INDIA, your career partner!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.viga(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          'One of the best Training Destination for Software, Networking and Cloud Computing courses in India with 17 years of Industrial experience.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.viga(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image.asset(
                            'images/stars.png',
                            height: 70,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            'Google 4.9 * Rated Institute',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                text:
                                    'PROFESSIONALS oriented on-the-job TRAINING model. SCOPE INDIA provides courses for Software Programming in ',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                // Changed color to white
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Python (Data Science | Artificial Intelligence | Machine Learning | Deep Learning, Data Analytics)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: ', ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: 'Java',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: ', ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: 'PHP',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: ', ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: '.Net',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: ', ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: 'MERN',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text:
                                          ', Software Testing Manual and Automation, Cloud Computing (',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: 'AWS | Azure',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: '), Server Administration (',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: 'MicroSoft MCSE | Linux RHCE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: '), Networking (',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: 'CCNA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text:
                                          '), DevOps, Mobile App Development in ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text: 'Flutter',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  // Changed color to white
                                  TextSpan(
                                      text:
                                          ', and Digital Marketing. Training with a 100% Trusted Job-Based Internship Model. SCOPE INDIA has a Strong Placement Cell that provides jobs to thousands of students every year. We assure you, you won\'t regret it after training from SCOPE INDIA!\n\nThis is how SCOPE INDIA can support both newbies and experienced in the industry to upgrade their skills.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  // Changed color to white
                                ],
                              ),
                              textAlign: TextAlign.justify,
                            )),
                        SizedBox(height: 10,),

                        Center(
                          child: buildButton(
                            context,
                            'Courses',
                            CourseScreen(),
                            Colors.yellow
                          ),
                        ),
                        SizedBox(height: 10), // Space between buttons
                        Center(
                          child: buildButton(
                            context,
                            'Placements',
                            RecentPlacementsScreen(),
                              Colors.green

                          ),
                        ),
                        SizedBox(height: 10), // Space between buttons
                        Center(
                          child: buildButton(
                            context,
                            'Sign Up',
                            SignUpScreen(),
                              Colors.red

                          ),
                        ),
                        SizedBox(height: 10,),

                        Center(child: Image(image: AssetImage('images/training.png'))),
                        SizedBox(height: 8,),
                        Center(
                          child: Text('Training',textAlign: TextAlign.center,
                          style: GoogleFonts.viga(
                            textStyle:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.yellow
                            )
                          )
                          ),
                        ),
                    SizedBox(height: 8,),
                    Center(
                      child: Text('  You are trained under Suffix E Solutions working professionals, on-the-job training model.'
                      ,textAlign: TextAlign.center,
                          style: GoogleFonts.viga(
                              textStyle:TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellow[100]
                              )
                          )
                      ),
                    ),
                        Center(child: Image(image: AssetImage('images/grooming.png'))),
                        SizedBox(height: 8,),
                        Center(
                          child: Text('Grooming',textAlign: TextAlign.center,
                              style: GoogleFonts.viga(
                                  textStyle:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.yellow
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 8,),
                        Center(
                          child: Text('After course completion, you will be proceeded to live projects with a 6 months experience certificate.'
                              ,textAlign: TextAlign.center,
                              style: GoogleFonts.viga(
                                  textStyle:TextStyle(
                                      fontSize: 20,
                                      color: Colors.yellow[100]
                                  )
                              )
                          ),
                        ),
                        Center(child: Image(image: AssetImage('images/internship.png'))),
                        SizedBox(height: 8,),
                        Center(
                          child: Text('Internship',textAlign: TextAlign.center,
                              style: GoogleFonts.viga(
                                  textStyle:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.yellow
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 8,),
                        Center(
                          child: Text('CV Preparation, Interview Preparation, and Personality Development.'
                              ,textAlign: TextAlign.center,
                              style: GoogleFonts.viga(
                                  textStyle:TextStyle(
                                      fontSize: 20,
                                      color: Colors.yellow[100]
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 8,),

                        Center(child: Image(image: AssetImage('images/placement.png'))),
                        SizedBox(height: 8,),
                        Center(
                          child: Text('Placements',textAlign: TextAlign.center,
                              style: GoogleFonts.viga(
                                  textStyle:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.yellow
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 8,),
                        Center(
                          child: Text(' Gives 100% FREE placement support to all our fellow techies through SCOPE INDIA\'s Placement Cell.'
                              ,textAlign: TextAlign.center,
                              style: GoogleFonts.viga(
                                  textStyle:TextStyle(
                                      fontSize: 20,
                                      color: Colors.yellow[100]
                                  )
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue[900],
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'images/scopeindia-title.png',
                          // Replace with your image path
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Center for Software, Networking, & Cloud Education',
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                        Text(
                          'Kerala: Technopark TVM | Thampanoor TVM | Kaloor Kochi, Tamil Nadu: Distillery Road | Palace Road Nagercoil',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                        SizedBox(height: 8),
                        Image.asset(
                          'images/iso_iaflogo.png',
                          // Replace with your image path
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'An ISO 9001:2015 Certified Company',
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                        Text(
                          'All Rights Reserved Suffix E Solutions © 2007-2024',
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                        // Add more images here as needed
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
