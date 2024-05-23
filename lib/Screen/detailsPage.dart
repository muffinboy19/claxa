import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gleo_x/style/colour.dart';
import '../style/string.dart';
import 'home_screen.dart'; // Import the home screen file

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _pronounController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  int _completedFields = 0;

  void _updateProgress() {
    setState(() {
      _completedFields = [
        _nameController.text,
        _ageController.text,
        _professionController.text,
        _pronounController.text,
        _experienceController.text,
      ].where((text) => text.isNotEmpty).length;
    });
  }

  void _onSignUp() {
    if (_nameController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _professionController.text.isEmpty ||
        _pronounController.text.isEmpty ||
        _experienceController.text.isEmpty) {
      HapticFeedback.vibrate();
      // Handle empty field case here
    } else {
      // Check if all fields are completed
      if (_completedFields == 5) {
        // Navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen()), // Replace HomeScreen() with your home screen widget
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/loginPageBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/png/gleopic.png', // Replace with your image asset path
                          height: 56.0,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          appName,
                          style: TextStyle(
                            fontFamily: 'boxx',
                            color: deepPurple, // Changed to deepPurple
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 30.0),
                    _buildFeedbackBar(),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:  greyWhite,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabelText('Name'),
                            _buildTextField(
                              controller: _nameController,
                              hint: "Name",
                              icon: Icons.person,
                              onChanged: _updateProgress,
                            ),
                            const SizedBox(height: 20.0),
                            _buildLabelText('Age'),
                            _buildTextField(
                              controller: _ageController,
                              hint: "Age",
                              icon: Icons.calendar_today,
                              onChanged: _updateProgress,
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 20.0),
                            _buildLabelText('Profession'),
                            _buildTextField(
                              controller: _professionController,
                              hint: "Profession",
                              icon: Icons.work,
                              onChanged: _updateProgress,
                            ),
                            const SizedBox(height: 20.0),
                            _buildLabelText('Pronoun'),
                            _buildTextField(
                              controller: _pronounController,
                              hint: "Pronoun",
                              icon: Icons.person_outline,
                              onChanged: _updateProgress,
                            ),
                            const SizedBox(height: 20.0),
                            _buildLabelText('Years of Experience'),
                            _buildTextField(
                              controller: _experienceController,
                              hint: "Years of Experience",
                              icon: Icons.timeline,
                              onChanged: _updateProgress,
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _onSignUp,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                        elevation: 5,
                        shadowColor: Colors.black,
                        minimumSize: const Size(double.infinity, 35), // Adjust button width
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 32.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: 'boxx',
                            color: White,
                            fontSize: 32, // Adjust button font size
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                        20.0), // Adjusted to make space for the new button position
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required void Function() onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: greyWhite, // Background color of input box

      ),
      child: Card(
        elevation: 0, // Remove elevation from Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            hintText: hint,
            hintStyle: const TextStyle(
              color: greyBlack,
              fontSize: 16,
              fontFamily: 'boxx',
            ),
            filled: true,
            fillColor: Colors.transparent, // Make the Card transparent
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(icon, color: greyBlack), // Changed icon color to greyBlack
          ),
          keyboardType: keyboardType,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: greyBlack,
            fontSize: 18,
            height: 1.5,
          ),
          onChanged: (_) => onChanged(),
        ),
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Container(
      color: Colors.transparent, // Background color for the label
      padding: const EdgeInsets.symmetric(vertical: .0),
      child: Text(
        text,
        style: const TextStyle(
          color: greyBlack, // Text color
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFeedbackBar() {
    return LinearProgressIndicator(
      value: _completedFields / 5,
      backgroundColor: greyWhite,
      color: Colors.deepPurple,
    );
  }
}
