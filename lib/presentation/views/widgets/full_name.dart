import 'package:flutter/material.dart';

class FullName extends StatelessWidget {
  final String firstName;
  final String lastName;

  const FullName({super.key, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$firstName $lastName',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
