import 'package:flutter/material.dart';

class LoaddingApp extends StatelessWidget {
  const LoaddingApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  }
}
