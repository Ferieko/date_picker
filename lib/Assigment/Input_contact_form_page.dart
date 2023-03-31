import 'package:flutter/material.dart';

class InputContactFormPage extends StatelessWidget {
  const InputContactFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Book Alterra')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'First Name'),
            ),
            const SizedBox(height: 12.0),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Last Name'),
            ),
            const SizedBox(height: 12.0),
            const TextField(
              decoration: InputDecoration(
                  prefix: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number'),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('SUBMIT')))
              ],
            )
          ],
        ),
      ),
    );
  }
}