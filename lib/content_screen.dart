import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return const Center(
          child: Text(
            "Content Screen",
          ),
        );
      },
    );
  }
}
