import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';
import 'package:flutter_finance_controller/src/shared/constants/constants.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      onTap: () {}, 
      leading: SizedBox(
        height: 40.0,
        child: CircleAvatar(
          backgroundColor: AppColors.amarelo,
          child: SizedBox(
            height: 20.0,
            child: Image.asset(
              AppImages.icTransport,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        'Refeição',
        style: AppTextStyles.purple16w500Roboto,
      ),
      subtitle: Text(
        '04/08/2021',
        style: AppTextStyles.gray14w400Roboto,
      ),
      trailing: Text(
        '-R\$ 25,00',
        style: AppTextStyles.black16w400Roboto,
      ),
    );
  }
}
