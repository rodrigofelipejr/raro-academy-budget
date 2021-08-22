import 'dart:developer';

import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Validators {
  static String? validateName(String value) {
    return value.isEmpty ? "Preencha corretamente o nome!" : null;
  }

  static String? validateNumber(String value) {
    if (value.isEmpty) {
      return "Preencha corretamente o valor!";
    }

    try {
      double.parse(value);
      return null;
    } catch (e) {
      return "Digite um número";
    }
  }

  static String? validateTransactionCategory(String? value) {
    return value == null ? 'Campo obrigatório' : null;
  }

  static String? validateDate(String value) {
    try {
      initializeDateFormatting('pt_BR', null);
      DateFormat locateFormat = new DateFormat("dd/MM/yyyy");
      DateTime date = locateFormat.parse(value);
      if (locateFormat.format(date) != value) {
        return "Data inválida";
      }
      bool has18 = DateTime.now().subtract(Duration(days: 6570)).isAfter(date);
      bool hasLessThan120 = DateTime.now().subtract(Duration(days: 43800)).isAfter(date);

      if (has18) {
        if (hasLessThan120) {
          return "Data inválida";
        }
        return null;
      } else {
        return "É necessário ser maior de 18 anos";
      }
    } catch (e) {
      log(e.toString());
      return "Insira uma data no formato dd/mm/yyyy";
    }
  }

  static String? cpfValidator(String value) {
    if (CPFValidator.isValid(value)) {
      return null;
    } else {
      return "CPF inválido";
    }
  }

  static String? phoneValidator(String value) {
    if (value.length >= 14) {
      return null;
    } else {
      return "Telefone inválido";
    }
  }

  static String? validatePassword(String value, String value1) {
    if (value.length < 8) {
      return "A senha deve conter mais que 8 caracteres";
    }

    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) return "Deve conter pelo menos um caractere maiúsculo";
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) return "Deve conter pelo menos um caractere minúsculo";
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) return "Deve conter pelo menos um número";
    if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}').hasMatch(value)) return "Deve conter pelo menos um caractere especial";

    if (value != value1) {
      return "As senhas não conferem";
    }
  }

  static String? email(String email) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return null;
    } else {
      return "Insira um endereço de email";
    }
  }

  static String? validateDescription(String? value) {
    return value?.isEmpty == true ? "Informe uma descrição válida" : null;
  }
}
