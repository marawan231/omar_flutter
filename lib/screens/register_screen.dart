// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:omar_flutter/route_manager.dart';
import 'package:omar_flutter/widgets/custom_button.dart';
import 'package:omar_flutter/widgets/custom_textfield.dart';

import '../model/user.dart';
import '../users_database.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  int idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch;
  }

  checkValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid data';
    }
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      validator: (value) {
        return checkValidation(value);
      },
      controller: emailController,
      hintText: 'Email',
      
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      hintText: 'Password',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  //build confirm password text field
  Widget _buildConfirmPasswordTextField() {
    return CustomTextField(
      controller: confirmPasswordController,
      hintText: ' Confirm Password',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  //build name text field
  Widget _buildNameTextField() {
    return CustomTextField(
      controller: nameController,
      hintText: 'Name',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  //build phone text field
  Widget _buildPhoneTextField() {
    return CustomTextField(
      controller: phoneController,
      hintText: 'Phone',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  //build age text field
  Widget _buildAgeTextField() {
    return CustomTextField(
      controller: ageController,
      hintText: 'Age',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  //build height text field
  Widget _buildHeightTextField() {
    return CustomTextField(
      controller: heightController,
      hintText: 'Height',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  //build weight text field
  Widget _buildWeightTextField() {
    return CustomTextField(
      controller: weightController,
      hintText: 'Weight',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  _buildRegisterButton() {
    return CustomButton(
      text: 'Register',
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          
          if (passwordController.text != confirmPasswordController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password Not Match'),
              ),
            );
          } else {

            final user = User(
              id: idGenerator(),
              userEmail: emailController.text,
              password: passwordController.text,
              userName: nameController.text,
              phone: phoneController.text,
              age: ageController.text,
              height: heightController.text,
              weight: weightController.text,
            );

            await UsersDatabase.instance.create(user);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Register Successfully'),
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
          }
        }
      },
    );
  }

  Widget _buildWantToRegisterText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Register')),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildEmailTextField(),
                  const SizedBox(height: 20),
                  _buildPasswordTextField(),
                  const SizedBox(height: 20),
                  _buildConfirmPasswordTextField(),
                  const SizedBox(height: 20),
                  _buildNameTextField(),
                  const SizedBox(height: 20),
                  _buildPhoneTextField(),
                  const SizedBox(height: 20),
                  _buildAgeTextField(),
                  const SizedBox(height: 20),
                  _buildHeightTextField(),
                  const SizedBox(height: 20),
                  _buildWeightTextField(),
                  const SizedBox(height: 20),
                  _buildRegisterButton(),
                  _buildWantToRegisterText(context),

                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
  }
}
