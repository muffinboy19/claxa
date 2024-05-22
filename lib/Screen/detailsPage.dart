import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gleo_x/Elements/Buttons/white_button.dart';
import 'package:gleo_x/style/colour.dart';
import '../style/string.dart';

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
      // Perform the sign-up action
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightblueBackground, // Change to the previous color theme
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  appName,
                  style: TextStyle(
                    fontFamily: 'boxx',
                    color: White,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                _buildFeedbackBar(), // Moved feedback bar here
                const SizedBox(height: 20.0), // Added spacing
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: lightblueBackground,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: White,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTextField(
                        controller: _nameController,
                        hint: "Name",
                        icon: Icons.person,
                        onChanged: _updateProgress,
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextField(
                        controller: _ageController,
                        hint: "Age",
                        icon: Icons.calendar_today,
                        onChanged: _updateProgress,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextField(
                        controller: _professionController,
                        hint: "Profession",
                        icon: Icons.work,
                        onChanged: _updateProgress,
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextField(
                        controller: _pronounController,
                        hint: "Pronoun",
                        icon: Icons.person_outline,
                        onChanged: _updateProgress,
                      ),
                      const SizedBox(height: 20.0),
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
                const SizedBox(height: 30.0),
                WhiteButton(
                  text: "Sign Up",
                  borderRadius: 15,
                  onPressed: _onSignUp,
                ),
              ],
            ),
          ),
        ),
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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Black57,
          fontSize: 18,
          fontFamily: 'boxx',
        ),
        filled: true,
        fillColor: inputFieldColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(icon, color: Black57),
      ),
      keyboardType: keyboardType,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Black57,
        fontSize: 18,
        height: 1.5,
      ),
      onChanged: (_) => onChanged(),
    );
  }

  Widget _buildFeedbackBar() {
    return LinearProgressIndicator(
      value: _completedFields / 5,
      backgroundColor: Colors.grey[300],
      color: primaryColor,
    );
  }
}

