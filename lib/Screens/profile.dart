import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final url = Uri.https(
        'scopefinalproject-8f078-default-rtdb.firebaseio.com', 'users/${widget.user.uid}.json');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          userData = data;
        });
      } else {
        print("Failed to fetch user data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching user data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // User Details
            Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Information', style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 8.0),
                    _buildUserInfoRow('Username:', userData!['username']),
                    _buildUserInfoRow('Email:', userData!['email']),
                    _buildUserInfoRow('Age:', userData!['age'].toString()),
                    _buildUserInfoRow('Date of Birth:', userData!['dob']),
                    _buildUserInfoRow('State:', userData!['state']),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Joined Courses
            Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Joined Courses', style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 8.0),
                    userData!['joinedCourses'] != null && userData!['joinedCourses'].isNotEmpty
                        ? DataTable(
                      columns: [
                        DataColumn(label: Text('Course Name')),
                      ],
                      rows: List.generate(
                        (userData!['joinedCourses'] as List).length,
                            (index) => DataRow(
                          cells: [
                            DataCell(Text(userData!['joinedCourses'][index])),
                          ],
                        ),
                      ),
                    )
                        : Text('No courses joined yet.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
