import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  final List<String> historico;

  const HistoricoPage({super.key, required this.historico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico', style: TextStyle(
          fontSize: 30,
          color: Colors.white
        ),),
        backgroundColor: Colors.black,
         iconTheme: const IconThemeData(
    color: Colors.orange, // Altere para a cor desejada
  ),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: historico.length,
        itemBuilder: (context, index) {
          final item = historico[index];
          return ListTile(
            title: Text(
              item,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}
