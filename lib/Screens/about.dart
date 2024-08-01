import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
          title: Center(child: Image.asset('images/scope-india-logo-bird.png',
            height: 50,
          )),
        ),
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/homescreenbg.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
      
                Text(
                  'SCOPE INDIA, your career partner!',style: GoogleFonts.viga(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  textAlign: TextAlign.center,
      
                ),
                Text(
                  'One of the best Training Destination for Software, Networking and Cloud Computing courses in India with 17 years of Industrial experience.',textAlign: TextAlign.center,
                  style: GoogleFonts.viga(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset('images/stars.png'),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    'Google 4.9 * Rated Institute',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
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

                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  color: Colors.blue[900],
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/scopeindia-title.png',
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Center for Software, Networking, & Cloud Education',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Kerala: Technopark TVM | Thampanoor TVM | Kaloor Kochi, Tamil Nadu: Distillery Road | Palace Road Nagercoil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Image.asset(
                        'images/iso_iaflogo.png',
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'An ISO 9001:2015 Certified Company',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'All Rights Reserved Suffix E Solutions © 2007-2024',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
    );
  }
}