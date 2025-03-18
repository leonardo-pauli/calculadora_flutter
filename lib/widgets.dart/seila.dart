class Calculadora {
  String numero = '0';
  String operacao = '';
  double primeiroNumero = 0;
  double segundoNumero = 0;

  void calcular(String tecla, Function(String) atualizarNumero) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        if (numero == '0' && tecla != '.') {
          numero = tecla;
        } else if (numero.length < 10) {
          numero += tecla;
        }
        break;
      case '.':
        if (!numero.contains('.')) {
          if (numero == '0') {
            numero = '0.';
          } else {
            numero += '.';
          }
        }
        break;

      case 'AC':
        numero = '0';
        operacao = '';
        primeiroNumero = 0;
        segundoNumero = 0;
        break;

      case '+':
      case '-':
      case 'X':
      case '/':
        operacao = tecla;
        primeiroNumero = double.parse(numero);
        numero = '0';
        break;

      case '%':
        numero = (double.parse(numero) / 100).toString();
        break;

      case '<X':
        numero =
            numero.length > 1 ? numero.substring(0, numero.length - 1) : '0';
        break;

      case '=':
        if (double.tryParse(numero) != null) {
          segundoNumero = double.parse(numero);
          double resultado = 0;
         

          if (operacao == '+') resultado = primeiroNumero + segundoNumero;
          if (operacao == '-') resultado = primeiroNumero - segundoNumero;
          if (operacao == 'X') resultado = primeiroNumero * segundoNumero;
          if (operacao == '/') resultado = primeiroNumero / segundoNumero;
           numero = resultado
              .toStringAsFixed(8)
              .replaceFirst(RegExp(r'0*$'), '')
              .replaceFirst(RegExp(r'\.$'), '');
          numero = resultado.toString();
        }

        break;
    }

    // Atualiza o número na interface
    atualizarNumero(numero);
  }
}
