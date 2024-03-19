import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                height: 150, // Set height for the container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile_picture.jpg'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Abdul Karim',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Mobile: 123-456-7890',
                      style: TextStyle(
                        fontSize: 14, // Decrease font size here
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'abdulkarimtwk@gmail.com',
                      style: TextStyle(
                        fontSize: 14, // Decrease font size here
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Logic for About
                print('About');
                Navigator.pop(
                    context); // Close the drawer after selecting an option
              },
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () {
                // Logic for Log out
                print('Log out');
                Navigator.pop(
                    context); // Close the drawer after selecting an option
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              width: double.infinity, // Set width for the container
              height: 550, // Set height for the container
              decoration: BoxDecoration(
                color: Colors.blue[800],
                // Change container background color to dark blue
                borderRadius: BorderRadius.circular(25), // Add rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Logic to view all records
                      print('View All Records');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      //padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      backgroundColor: Colors.lightBlue, // Make button transparent
                      shadowColor: Colors.transparent, // Remove button shadow
                      // Add bottom rounded corners
                    ),
                    child: Text('View All Records', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Logic to edit attendance
                      print('Edit Attendance');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      //padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      backgroundColor: Colors.lightBlue, // Make button transparent
                      shadowColor: Colors.transparent, // Remove button shadow

                    ),
                    child: Text('Edit Attendance', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Logic to generate user attendance report
                      print('Generate User Attendance Report');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      //padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      backgroundColor: Colors.lightBlue, // Make button transparent
                      shadowColor: Colors.transparent, // Remove button shadow

                    ),
                    child: Text('Generate User Attendance Report', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Logic for leave approval
                      print('Leave Approval');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      //  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      backgroundColor: Colors.lightBlue, // Make button transparent
                      shadowColor: Colors.transparent, // Remove button shadow

                    ),
                    child: Text('Leave Approval', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}