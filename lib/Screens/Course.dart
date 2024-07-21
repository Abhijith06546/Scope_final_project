import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final List<Map<String, String>> courses = [
    {'name': 'Java Full Stack Internship', 'description': 'Complete internship covering Java full stack development.'},
    {'name': 'Python Full Stack Internship', 'description': 'Internship focused on full stack development using Python.'},
    {'name': 'PHP Full Stack Internship', 'description': 'Internship program covering PHP full stack development.'},
    {'name': '.Net Core Full Stack Internship', 'description': 'Internship with comprehensive training in .Net Core full stack.'},
    {'name': 'MERN Full Stack Internship', 'description': 'Internship focusing on MERN stack technologies.'},
    {'name': 'MEAN Full Stack Internship', 'description': 'Internship program covering MEAN stack development.'},
    {'name': 'Android/iOS Mobile App Course in Google Flutter', 'description': 'Course for developing mobile apps using Flutter for both Android and iOS.'},
    {'name': 'Android/iOS Mobile App Course in IONIC', 'description': 'Learn to create mobile apps using the IONIC framework for Android and iOS.'},
    {'name': 'Website Designing Course', 'description': 'Course on designing and developing websites.'},
    {'name': 'UI/UX', 'description': 'Course focused on user interface and user experience design.'},
    {'name': 'Data Science & AI', 'description': 'Comprehensive course on data science and artificial intelligence.'},
    {'name': 'Data Analytics', 'description': 'Course covering data analytics techniques and tools.'},
    {'name': 'Digital Marketing Expert', 'description': 'Become an expert in digital marketing strategies and tools.'},
    {'name': 'Microsoft Power BI Designing', 'description': 'Course on designing dashboards and reports using Microsoft Power BI.'},
  ];

  void _joinCourse(String courseName) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await _updateUserCourses(user.uid, courseName);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Joined $courseName"),
            duration: Duration(seconds: 3),
          ),
        );
      } catch (e) {
        print("Error joining course: ${e.toString()}");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please log in to join a course."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _updateUserCourses(String uid, String courseName) async {
    final url = Uri.https(
        'scopefinalproject-8f078-default-rtdb.firebaseio.com', 'users/$uid.json');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);

        List<String> joinedCourses = userData['joinedCourses'] != null
            ? List<String>.from(userData['joinedCourses'])
            : [];
        // this  converts the existing list from the userData map into a new List<String>. This ensures that the list is of the correct type and creates a copy of the original list.
        if (!joinedCourses.contains(courseName)) {
          joinedCourses.add(courseName);
        }

        final updateResponse = await http.put(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            ...userData,
            'joinedCourses': joinedCourses,
          }),
        );

        if (updateResponse.statusCode == 200) {
          print("User courses updated successfully");
        } else {
          print("Failed to update user courses: ${updateResponse.statusCode}");
        }
      } else {
        print("Failed to fetch user data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error updating user courses: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  course['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text(
                  course['description']!,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: user == null
                      ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please log in to join a course."),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                      : () {
                    _joinCourse(course['name']!);
                  },
                  child: Text('Join Now'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
