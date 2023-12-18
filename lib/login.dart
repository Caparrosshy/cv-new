import 'homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  
  get onTap => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Color.fromARGB(244, 145, 245, 145)      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/icon.webp'),
                height: 100,
                width: 100,
              ),
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  color: Colors.green,
                ),
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Invalid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  color: Colors.green,
                ),
                controller: _passwordController,
                obscureText: passToggle,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(102, 194, 49, 1),
                      fontFamily: 'RobotoMono',
                    ),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    }, icon: Icon(passToggle ? Icons.visibility : Icons.visibility_off))
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (_passwordController.text.length < 6) {
                    return 'Password Length should be more than 6 characters';
                  } else if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$')
                      .hasMatch(value)) {
                    return 'Password needs to fulfill the criteria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 91, 192, 143)),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // Check for specific username and password
                    if (_usernameController.text == "shycaprrs@gmail.com" &&
                        _passwordController.text == "Shyshy@123") {
                      // Successful login
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Firstpage()),
                      );
                    } else {
                      // Incorrect username or password
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Incorrect username or password'),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Color.fromARGB(255, 5, 5, 5),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}