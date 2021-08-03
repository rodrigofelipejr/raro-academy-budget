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
    //FIXME - ic para pagamentos
    CategoryTransaction.payments: {
      AppImages.icMeal: AppColors.roxo,
    },
    //FIXME - ic para outros
    CategoryTransaction.others: {
      AppImages.icMeal: AppColors.purpleLight,
    },
  };
}
