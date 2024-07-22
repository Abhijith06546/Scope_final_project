import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _messageController = TextEditingController();
  final String supportEmail = ''; // Replace with your email address
  final String smtpServerUsername = ''; // Replace with your SMTP server username
  final String smtpServerPassword = ''; // Replace with your App Password

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Request a Callback',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Message',
              ),
              maxLines: 5,
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
          ],
        ),
      ),
    );
  }
}
