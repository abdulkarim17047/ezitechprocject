import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import statement
import 'register_page.dart';
import 'user_panel.dart'; // Import the UserPanel class/file
import 'admin_panel.dart'; // Import the AdminPanel class/file
import 'database_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _isMobileFocused = false;
  bool _isPasswordFocused = false;
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Sign In",
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[800], // Changed to dark blue
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25), // Rounded corners at the bottom
                    bottomRight: Radius.circular(25), // Rounded corners at the bottom
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: DropdownButtonFormField<String>(
                            value: _selectedRole,
                            hint: Text(
                              'Select Role',
                              style: TextStyle(color: Colors.white), // Set hint text color to white
                            ),
                            items: ['Admin', 'User'].map((String role) {
                              return DropdownMenuItem<String>(
                                value: role,
                                child: Text(
                                  role,
                                  style: TextStyle(color: Colors.white), // Set text color to white
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedRole = value;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Role',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0,
                                ),
                              ),
                              prefixIcon: Icon(Icons.person, color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white), // Set button text color to white
                            elevation: 2, // Set elevation to 2
                            iconEnabledColor: Colors.lightBlue, // Set icon color when enabled to light blue
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a role';
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: TextFormField(
                            controller: _mobileController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(11),
                            ],
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(color: Colors.white), // Text color
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0,
                                ),
                              ),
                              prefixIcon: !_isMobileFocused ? Icon(Icons.phone, color: Colors.white) : null,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile number';
                              } else if (value.length != 11) {
                                return 'Mobile number must be 11 digits';
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _isMobileFocused = true;
                              });
                            },
                            onEditingComplete: () {
                              setState(() {
                                _isMobileFocused = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(12),
                            ],
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white), // Text color
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.white, // Border color
                                  width: 2.0,
                                ),
                              ),
                              prefixIcon: !_isPasswordFocused ? Icon(Icons.lock, color: Colors.white) : null,
                              suffixIcon: !_isPasswordFocused ? Icon(Icons.visibility, color: Colors.white) : null,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _isPasswordFocused = true;
                              });
                            },
                            onEditingComplete: () {
                              setState(() {
                                _isPasswordFocused = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith((states) => Colors.yellow),
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                // Add logic for forgot password
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String mobileNumber = _mobileController.text;
                              String password = _passwordController.text;
                              print('Role: $_selectedRole');
                              print('Mobile Number: $mobileNumber');
                              print('Password: $password');

                              // Save user data to database
                              await DatabaseHelper.instance.insertLogin({
                                DatabaseHelper.columnName: _selectedRole,
                                DatabaseHelper.columnMobile: mobileNumber,
                                DatabaseHelper.columnPassword: password,
                              });

                              // Navigate based on selected role
                              if (_selectedRole == 'User') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UserPanel()),
                                );
                              } else if (_selectedRole == 'Admin') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AdminPanel()),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                            backgroundColor: Colors.blue,
                          ),
                          child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'OR',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Sign in with',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Add logic for Facebook sign-in
                              },
                              icon: Image.asset('assets/images/facebook_icon.png', width: 40, height: 40), // Facebook icon image
                            ),
                            IconButton(
                              onPressed: () {
                                // Add logic for Google sign-in
                              },
                              icon: Image.asset('assets/images/google_icon.png', width: 35, height: 35), // Google icon image
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage()), // Assuming RegisterPage is the name of your registration page
                            );
                          },
                          child: Text(
                            "Don't have an account? Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
