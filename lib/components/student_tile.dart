import 'package:flutter/material.dart';
import '/components/components.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const RoundedImage(
          imageRadius: 20,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text('Halo')],
          ),
        ),
      ],
    );
  }
}
