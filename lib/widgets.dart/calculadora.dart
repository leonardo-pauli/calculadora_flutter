import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculadora {
  String _expressao = '';
  String _resultado = '0';
  bool _resultadoMostrado = false;

  void input(
    String key,
    Function(String) atualizarDisplay,
    Function(String) atualizarPreview,
    Function(String, String)? onCalculoFinalizado,
  ) {
    switch (key) {
      case 'AC':
        _limpar(atualizarDisplay, atualizarPreview);
        return;
      case '<X':
        _backspace(atualizarDisplay, atualizarPreview);
        return;
      case '=':
        _calcular(atualizarDisplay, atualizarPreview, onCalculoFinalizado);
        return;
      default:
        _adicionarCaractere(key, atualizarDisplay, atualizarPreview);
        return;
    }
  }

  void _limpar(Function(String) atualizarDisplay, Function(String) atualizarPreview) {
    _expressao = '';
    _resultado = '0';
    _resultadoMostrado = false;
    atualizarDisplay(_resultado);
    atualizarPreview('');
  }

  void _backspace(Function(String) atualizarDisplay, Function(String) atualizarPreview) {
    if (_expressao.isNotEmpty) {
      _expressao = _expressao.substring(0, _expressao.length - 1);
      atualizarDisplay(_expressao.isEmpty ? '0' : _expressao);
      _calcularPreview(atualizarPreview);
    }
  }

  void _calcular(
    Function(String) atualizarDisplay,
    Function(String) atualizarPreview,
    Function(String, String)? onCalculoFinalizado,
  ) {
    if (_expressao.isEmpty) return;

    try {
      final expFormatada = _processarPorcentagem(_expressao);
      final parser = Parser();
      final expressao = parser.parse(expFormatada.replaceAll('X', '*'));
      final contexto = ContextModel();
      final resultado = expressao.evaluate(EvaluationType.REAL, contexto);
      _resultado = _formatarResultado(resultado);
      _resultadoMostrado = true;
      atualizarDisplay(_resultado);
      atualizarPreview('');
      if (onCalculoFinalizado != null) {
        onCalculoFinalizado(_expressao, _resultado);
      }
    } catch (_) {
      atualizarDisplay('Erro');
      atualizarPreview('');
    }
  }

  void _adicionarCaractere(
    String key,
    Function(String) atualizarDisplay,
    Function(String) atualizarPreview,
  ) {
    if (_resultadoMostrado) {
      _expressao = isOperator(key) ? _resultado : '';
      _resultadoMostrado = false;
    }

    if (key == '.' && _ultimoNumeroJaContemPonto()) return;

    if (isOperator(key)) {
      if (_expressao.isEmpty && key != '-') return;

      final ultimo = _expressao.characters.last;
      if (isOperator(ultimo)) {
        _expressao = _expressao.substring(0, _expressao.length - 1);
      }
    }

    _expressao += mapKey(key);
    atualizarDisplay(_expressao);
    _calcularPreview(atualizarPreview);
  }

  void _calcularPreview(Function(String) atualizarPreview) {
    try {
      if (_expressao.isEmpty) {
        atualizarPreview('');
        return;
      }
      final exp = Parser().parse(_processarPorcentagem(_expressao.replaceAll('X', '*')));
      final resultado = exp.evaluate(EvaluationType.REAL, ContextModel());
      atualizarPreview(_formatarResultado(resultado));
    } catch (_) {
      atualizarPreview('');
    }
  }

  String _processarPorcentagem(String expressao) {
    final regex = RegExp(r'(\d+\.?\d*)%');
    return expressao.replaceAllMapped(regex, (match) {
      final valor = double.parse(match.group(1)!);
      return (valor / 100).toString();
    });
  }

  String _formatarResultado(double result) {
    final texto = result.toStringAsFixed(8);
    return texto.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
  }

  bool isOperator(String key) => ['+', '-', 'X', '/', '%', '*'].contains(key);

  String mapKey(String key) => key == 'X' ? '*' : key;

  bool _ultimoNumeroJaContemPonto() {
    final partes = _expressao.split(RegExp(r'[+\-*/%]'));
    final ultimo = partes.isNotEmpty ? partes.last : '';
    return ultimo.contains('.');
  }
}
