import 'dart:developer';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:password_strength/password_strength.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Validators {
  String? validateName(String value) {
    return value.isEmpty ? "Preencha corretamente o nome!" : null;
  }

  String? validateDate(String value) {
    try {
      initializeDateFormatting('pt_BR', null);
      DateFormat locateFormat = new DateFormat("dd/MM/yyyy");
      DateTime date = locateFormat.parse(value);
      if (locateFormat.format(date) != value) {
        return "Data inválida";
      }
      bool has18 = DateTime.now().subtract(Duration(days: 6570)).isAfter(date);
      bool hasLessThan120 =
          DateTime.now().subtract(Duration(days: 43800)).isAfter(date);

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

  String? cpfValidator(String value) {
    if (CPFValidator.isValid(value)) {
      return null;
    } else {
      return "CPF inválido";
    }
  }

  String? phoneValidator(String value) {
    if (value.length >= 14) {
      return null;
    } else {
      return "Telefone inválido";
    }
  }

  String? validatePassword(String value, String value1) {
    if (value.length < 8) {
      return "A senha deve conter mais que 8 caracteres";
    }

    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value))
      return "Deve conter pelo menos um caracter maiúsculo";
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value))
      return "Deve conter pelo menos um caracter minúsculo";
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value))
      return "Deve conter pelo menos um número";
    if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}').hasMatch(value))
      return "Deve conter pelo menos um caracter especial";

    if (value != value1) {
      return "As senhas não conferem";
    }
  }

  String? email(String email) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return null;
    } else {
      return "Insira um endereço de email";
    }
  }
}
