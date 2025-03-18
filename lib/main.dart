import 'package:calculadora/widgets.dart/seila.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

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
  Calculadora calc = Calculadora(); // Criando a instância da Calculadora
  String numero = '0';

  void atualizarNumero(String novoNumero) {
    setState(() {
      numero = novoNumero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 280, 5, 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    numero,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('AC', atualizarNumero),
                    child: Text(
                      'AC',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.orange[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('<X', atualizarNumero),

                    child: Icon(
                      Icons.backspace,
                      size: 30,
                      color: Colors.orange[600],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('%', atualizarNumero),
                    child: Icon(
                      Icons.percent,
                      color: Colors.orange[600],
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.orange[600],
                    ),
                    onPressed: () => calc.calcular('/', atualizarNumero),
                    child: Text(
                      '/',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('7', atualizarNumero),
                    child: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('8', atualizarNumero),
                    child: Text(
                      '8',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('9', atualizarNumero),
                    child: Text(
                      '9',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.orange[600],
                    ),
                    onPressed: () => calc.calcular('X', atualizarNumero),
                    child: Icon(Icons.close, size: 30, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('4', atualizarNumero),
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('5', atualizarNumero),
                    child: Text(
                      '5',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('6', atualizarNumero),
                    child: Text(
                      '6',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.orange[600],
                    ),
                    onPressed: () => calc.calcular('-', atualizarNumero),
                    child: Icon(Icons.remove, size: 30, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('1', atualizarNumero),
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('2', atualizarNumero),
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('3', atualizarNumero),
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.orange[600],
                    ),
                    onPressed: () => calc.calcular('+', atualizarNumero),
                    child: Icon(Icons.add, size: 30, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.orange[600],
                    ),
                    onPressed: () => calc.calcular('0', atualizarNumero),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.grey[850],
                    ),
                    onPressed: () => calc.calcular('.', atualizarNumero),
                    child: Text(
                      '.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fixedSize: Size.fromRadius(43),
                      backgroundColor: Colors.orange[600],
                    ),
                    onPressed: () => calc.calcular('=', atualizarNumero),
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
