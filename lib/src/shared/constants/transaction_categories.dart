import 'package:flutter/material.dart';

import 'constants.dart';
import '../models/models.dart';

class TransactionCategories {
  static const Map<CategoryTransaction, Map<String, Color>> mapCategoryImageColors = {
    CategoryTransaction.meal: {
      AppImages.icMeal: Colors.amber,
    },
    CategoryTransaction.transport: {
      AppImages.icTransport: AppColors.verde,
    },
    CategoryTransaction.trip: {
      AppImages.icTrip: AppColors.rosa,
    },
    CategoryTransaction.education: {
      AppImages.icEducation: AppColors.azul,
    },
    CategoryTransaction.payments: {
      AppImages.icPayments: AppColors.roxo,
    },
    CategoryTransaction.others: {
      AppImages.icOthers: AppColors.purpleLight,
    },
  };
}