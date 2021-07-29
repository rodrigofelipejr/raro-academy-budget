import 'dart:ui';

import 'package:flutter/material.dart';

import 'card_widget.dart';
import '../../../shared/constants/constants.dart';

class GeneralBalanceWidget extends StatefulWidget {
  const GeneralBalanceWidget({Key? key}) : super(key: key);

  @override
  GeneralBalanceStateWidget createState() => GeneralBalanceStateWidget();
}

class GeneralBalanceStateWidget extends State<GeneralBalanceWidget> {
  bool _visibleBalance = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saldo geral',
                style: AppTextStyles.purple20w500Roboto,
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    setState(() => _visibleBalance = !_visibleBalance);
                  },
                  icon: Icon(
                    Icons.visibility,
                    color: AppColors.roxo,
                  ),
                  splashColor: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            width: screenSize.width,
            child: Stack(
              children: <Widget>[
                Text(
                  'R\$ 3.000,00',
                  style: AppTextStyles.black24w400Roboto,
                ),
                if (_visibleBalance)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                          color: Colors.white.withOpacity(0.5),
                          child: Text(
                            ' ',
                            style: AppTextStyles.black24w400Roboto.copyWith(
                              color: AppColors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
