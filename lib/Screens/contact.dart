import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _messageController = TextEditingController();
  final String supportEmail = 'abhijithsajju@gmail.com'; // Replace with your email address
  final String smtpServerUsername = 'abhijithsajju@gmail.com'; // Replace with your SMTP server username
  final String smtpServerPassword = 'bzdo fril luhh mjex'; // Replace with your App Password

  Future<void> _sendEmail(String message) async {
    final smtpServer = SmtpServer(
      'smtp.gmail.com', // Correct SMTP server for Gmail
      username: smtpServerUsername,
      password: smtpServerPassword,
      port: 587, // Port for TLS
      ignoreBadCertificate: true, // Set this to true for self-signed certificates
      ssl: false, // Use TLS, not SSL
    );

    final messageToSend = Message()
      ..from = Address(supportEmail)
      ..recipients.add(supportEmail)
      ..subject = 'Request for Callback'
      ..text = 'Dear Support Team,\n\nI would like to request a callback regarding the following matter:\n\n$message\n\nThank you!';

    try {
      final sendReport = await send(messageToSend, smtpServer);
      print('Message sent: ${sendReport.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Callback request sent successfully!')),
      );
    } catch (e) {
      print('Message not sent. \n$e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send callback request.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locations = [
      {
        'title': 'Technopark TVM, Kerala',
        'address': 'Phase 1, Main Gate, Diamond Arcade, Near Technopark, Trivandrum',
        'phone': '9745936073',
        'email': 'technopark@scopeindia.org',
        'website': 'www.scopeindia.org',
      },
      {
        'title': 'Thampanoor TVM, Kerala',
        'address': 'TC 25/1403/3, Athens Plaza, SS Kovil Road, Thampanoor, Trivandrum, Kerala 695001',
        'phone': '9745936073',
        'email': 'info@scopeindia.org',
        'website': 'www.scopeindia.org',
      },
      {
        'title': 'Kochi, Kerala',
        'address': 'SCOPE INDIA, Vasanth Nagar Rd, near JLN Metro Station, Kaloor, Kochi, Kerala 682025',
        'phone': '7592939481',
        'email': 'kochi@scopeindia.org',
        'website': 'www.scopeindia.org',
      },
      {
        'title': 'Nagercoil, Tamil Nadu',
        'address': 'SCOPE INDIA, Near WCC College, Palace Rd, Nagercoil, Tamil Nadu 629001',
        'phone': '8075536185',
        'email': 'ngl@scopeindia.org',
        'website': 'www.scopeindia.org',
      },
      {
        'title': 'Nagercoil, Tamil Nadu',
        'address': 'SCOPE INDIA, Pharma Street, 5/2 Ward 28, Distillery Road, Putheri Nagercoil (Near WCC Jn)',
        'phone': '8075536185',
        'email': 'ngl@scopeindia.org',
        'website': 'www.scopeindia.org',
      },
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
          title: Center(child: Image.asset('images/scope-india-logo-bird.png',
            height: 50,
          )),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/homescreenbg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0), // Added padding around the container
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'SCOPE INDIA is open 365 days a year',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Let\'s discuss your career, 24/7 free Consultation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('images/stars.png'),
                SizedBox(height: 7),
                Center(
                  child: Text(
                    'Google 4.9 * Rated Institute',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Request a Callback',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kindly Add your Name and Email along with Your Message Here',
                    ),textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final message = _messageController.text;
                    if (message.isNotEmpty) {
                      _sendEmail(message);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a message.')),
                      );
                    }
                  },
                  child: Text('Send Callback Request'),
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: locations.map((location) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 2 - 32 + 100, // Adjust width for spacing and overflow
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                location['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(location['address']!),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.phone, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text(location['phone']!),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.email, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text(location['email']!),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.web, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      location['website']!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
