import 'package:flutter/material.dart';

import '../model/model.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/Login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'FOGGLE'),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailInput(),
            const SizedBox(height: 10),
            PasswordInput(),
            const SizedBox(height: 10),
            CustomElevatedButton(
              text: 'Login',
              beginColor: Theme.of(context).accentColor,
              endColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              text: 'Sign Up',
              beginColor: Theme.of(context).accentColor,
              endColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/Onboarding');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (email) {},
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (password) {},
      decoration: const InputDecoration(labelText: 'Password'),
    );
  }
}
