import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:uuid/uuid.dart';

class RegisterDetailsPage extends StatefulWidget {
  const RegisterDetailsPage(
      {super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  State<RegisterDetailsPage> createState() => _RegisterDetailsPageState();
}

class _RegisterDetailsPageState extends State<RegisterDetailsPage> {
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Регистрация',
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 35),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                  labelText: 'Ваше имя',
                  floatingLabelAlignment: FloatingLabelAlignment.start),
              inputFormatters: [
                FilteringTextInputFormatter.deny(' '),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Адрес доставки',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                UserEntity(
                  id: uuid.v1(),
                  email: widget.email,
                  password: widget.password,
                  name: userNameController.text,
                  address: addressController.text.trim(),
                  role: Role.customer,
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 19),
                    ),
                  ),
              child: const Text('ЗАРЕГИСТРИРОВАТЬСЯ'),
            ),
          ],
        ),
      ),
    );
  }
}
