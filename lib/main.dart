import 'package:calculadora/widgets.dart/historico.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/widgets.dart/calculadora.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Calculadora calc = Calculadora();
  String display = '0';
  String preview = '';
  final List<String> _historico = [];

  final List<List<String>> _buttons = [
    ['AC', '<X', '%', '/'],
    ['7', '8', '9', 'X'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', '='],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, 
            color: Colors.white,
            size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => HistoricoPage(historico: _historico),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildDisplay(),
            ..._buttons.map(_buildButtonRow),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              display,
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (preview.isNotEmpty && display.trim().isNotEmpty)
              Text(
                '= $preview',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> row) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: row.map(_buildButton).toList(),
      ),
    );
  }

  Widget _buildButton(String key) {
    final isOperator = ['+', '-', 'X', '/', '='].contains(key);
    final isFunction = ['AC', '<X', '%'].contains(key);

    final bgColor = isOperator ? Colors.orange[600] : Colors.grey[850];
    final fgColor = isFunction
        ? Colors.orange[600]
        : isOperator
            ? Colors.black
            : Colors.white;

    return Expanded(
      flex: key == '0' ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: bgColor,
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          onPressed: () {
            calc.input(
              key,
              (val) => setState(() => display = val),
              (prev) => setState(() => preview = prev),
              key == '='
                  ? (expr, res) =>
                      setState(() => _historico.add('$expr = $res'))
                  : null,
            );
          },
          child: _buildButtonChild(key, fgColor),
        ),
      ),
    );
  }

  Widget _buildButtonChild(String key, Color? color) {
    switch (key) {
      case '<X':
        return Icon(Icons.backspace, size: 28, color: color);
      case '/':
        return Image.asset('assets/images/dividir.png',
            height: 24, color: color);
      case '%':
        return Image.asset('assets/images/porcentagem.png',
            height: 28, color: color);
      default:
        return Text(
          key,
          style:
              TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.bold),
        );
    }
  }
}
