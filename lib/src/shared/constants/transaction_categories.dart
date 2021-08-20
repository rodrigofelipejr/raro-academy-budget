import 'package:flutter/material.dart';

import 'constants.dart';

class TransactionCategories {
  static const String meal = 'meal';
  static const String transport = 'transport';
  static const String trip = 'trip';
  static const String education = 'education';
  static const String payments = 'payments';
  static const String others = 'others';
  static const String pix = 'pix';
  static const String money = 'money';
  static const String doc = 'doc';
  static const String ted = 'ted';
  static const String ticket = 'ticket';

  static const Map<String, String> output = {
    TransactionCategories.meal: 'meal',
    TransactionCategories.education: 'education',
    TransactionCategories.others: 'others',
    TransactionCategories.payments: 'payments',
    TransactionCategories.transport: 'transport',
    TransactionCategories.trip: 'trip',
  };

  static const Map<String, String> input = {
    TransactionCategories.pix: 'pix',
    TransactionCategories.ticket: 'ticket',
    TransactionCategories.ted: 'ted',
    TransactionCategories.doc: 'doc',
    TransactionCategories.money: 'money',
  };

  static const Map<String, Map<String, Color>> mapCategoryImageColors = {
    meal: {AppImages.icMeal: Colors.amber},
    transport: {AppImages.icTransport: AppColors.verde},
    trip: {AppImages.icTrip: AppColors.rosa},
    education: {AppImages.icEducation: AppColors.azul},
    payments: {AppImages.icPayments: AppColors.roxo},
    others: {AppImages.icOthers: AppColors.melrose},
    pix: {AppImages.icPix: AppColors.azul},
    money: {AppImages.icPayments: AppColors.azul},
    doc: {AppImages.icDoc: AppColors.azul},
    ted: {AppImages.icTed: AppColors.azul},
    ticket: {AppImages.icBoleto: AppColors.azul},
  };
}
