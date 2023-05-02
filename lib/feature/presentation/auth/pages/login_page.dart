import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Вход',
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 35),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              inputFormatters: [FilteringTextInputFormatter.deny(' ')],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              inputFormatters: [FilteringTextInputFormatter.deny(' ')],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 19),
                    ),
                  ),
              child: const Text('ВОЙТИ'),
            ),
          ],
        ),
      ),
    );
  }
}
