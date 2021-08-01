import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';

class InputCard extends StatelessWidget {
  const InputCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.544,
                  child: ListView(
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        onTap: () {},
                        leading: SizedBox(
                          height: 40.0,
                          child: CircleAvatar(
                            backgroundColor: AppColors.amarelo,
                            child: SizedBox(
                              height: 20.0,
                            ),
                          ),
                        ),
                        title: Text(
                          "alou",
                        ),
                        subtitle: Text(
                          "alou",
                        ),
                        trailing: Text(
                          'alou',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total entradas',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 52, 48, 144)),
                          ),
                          Text(
                            '+R\$ 2.415,00',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 88, 179, 104)),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
