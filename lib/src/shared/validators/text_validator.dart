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

  String? validatePassword(String value, String value1) {
    if (value != value1) {
      return "As senhas não conferem";
    }
    double strength = estimatePasswordStrength(value);
    if (strength > 0.4) {
      return null;
    } else {
      var myRichRunesMessage = new Runes(
        ' \u{1F512} Escolha uma senha mais forte',
      );

      return new String.fromCharCodes(myRichRunesMessage);
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
