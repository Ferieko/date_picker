import 'package:flutter/material.dart';

/// Using Form & TextFormField
class DetilTransaksi2 extends StatefulWidget {
  const DetilTransaksi2({Key? key}) : super(key: key);

  @override
  State<DetilTransaksi2> createState() => _DetilTransaksi2State();
}

class _DetilTransaksi2State extends State<DetilTransaksi2> {
  var stateNamaPropinsi = 'Pilih';
  bool isValidate = false;

  final _formTransaksi = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formTransaksi,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  /// Payment Details
                  const Text('PAYMENT DETAILS'),
                  TextFormField(
                    validator: (value) {
                      if (isValidate) {
                        return null;
                      } else if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        isValidate = true;
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Name on card'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration:
                          const InputDecoration(hintText: 'Card number'),
                        ),
                      ),
                      const SizedBox(width: 32.0),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: 'Expiry'),
                        ),
                      ),
                      const SizedBox(width: 32.0),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: 'CVV'),
                        ),
                      )
                    ],
                  ),

                  /// Billing Address
                  const SizedBox(
                    height: 42.0,
                  ),
                  const Text('BILLING ADDRESS'),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration:
                          const InputDecoration(hintText: 'Street Address'),
                        ),
                      ),
                      const SizedBox(
                        width: 22.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: 'City'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: DropdownButton<String>(
                            hint: const Text('State / Province'),
                            value: stateNamaPropinsi,
                            items: const [
                              DropdownMenuItem<String>(
                                  value: 'Pilih', child: Text('Pilih')),
                              DropdownMenuItem<String>(
                                  value: 'Jawa Tengah', child: Text('Jawa Tengah')),
                              DropdownMenuItem<String>(
                                  value: 'Jawa Barat', child: Text('Jawa Barat')),
                              DropdownMenuItem<String>(
                                  value: 'Jawa Timur', child: Text('Jawa Timur')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                stateNamaPropinsi = value ?? '';
                              });
                            },
                          )),
                      const SizedBox(
                        width: 22.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: 'Zip Code'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 42.0,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formTransaksi.currentState != null) {
                            _formTransaksi.currentState!.validate();
                          }
                        },
                        child: const Text('Bayar')),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

