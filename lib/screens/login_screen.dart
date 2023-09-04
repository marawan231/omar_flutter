// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:omar_flutter/route_manager.dart';
import 'package:omar_flutter/values.dart';
import 'package:omar_flutter/widgets/custom_button.dart';
import 'package:omar_flutter/widgets/custom_textfield.dart';

import '../users_database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget _buildLoginBody(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildForm(),
        const SizedBox(height: 100),
        _buildLoginButton(context),
        const SizedBox(height: 10),
        _buildWantToRegisterText(context),
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            _buildEmailTextField(),
            const SizedBox(height: 10),
            _buildPasswordTextField(),
          ],
        ),
      ),
    );
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
      obscureText: true,
      hintText: 'Password',
      validator: (value) {
        return checkValidation(value);
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .01),
          CustomButton(
            text: 'Login',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _sumbitLoginData();
              }
            },
          ),
        ],
      ),
    );
  }

  _buildWantToRegisterText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14,
                color: Colors.black,
              ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.registerRoute);
            // BlocProvider.of<AuthCubit>(context).showRegisterForm();
          },
          child: Text(
            'Register',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  color: Colors.blue,
                ),
          ),
        ),
      ],
    );
  }

  _sumbitLoginData() async {
    final users = await UsersDatabase.instance.getAllUsers();

    for (var user in users) {
      if (user.userEmail == emailController.text &&
          user.password == passwordController.text) {
            
        myUser = user;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Login Successfully'),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeRoute, (route) => false);
      }
    }
    if (myUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Not Found, Please Register'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: _buildLoginBody(context),
    );
  }

  checkValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid data';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
