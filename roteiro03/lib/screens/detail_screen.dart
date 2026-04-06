import 'package:flutter/material.dart';

import '../widgets/title_text.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhe')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TitleText(text: 'Detalhe'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
