import 'package:flutter/material.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';

class DayPage extends StatefulWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  _DayPageState createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final PageController _pageController = PageController();
  int? tela;
  String get label => tela == 1
      ? 'Total entradas'
      : tela == 2
          ? 'TOTAL'
          : 'totaaskdask';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 28,
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.22,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.ac_unit),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppColors.blueGradientAppBar),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.14),
              Text(
                'R\$ 1.104,53',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => tela = 1,
                      child: Text(
                        'Entradas',
                        style: TextStyle(
                            fontSize: 16,
                            color: tela == 1
                                ? Colors.white
                                : Color.fromARGB(60, 255, 255, 255)),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => tela = 2,
                      child: Text(
                        'Saídas',
                        style: TextStyle(
                            fontSize: 16,
                            color: tela == 2
                                ? Colors.white
                                : Color.fromARGB(60, 255, 255, 255)),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => tela = 3,
                      child: Text(
                        'Todos',
                        style: TextStyle(
                            fontSize: 16,
                            color: tela == 3
                                ? Colors.white
                                : Color.fromARGB(60, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
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
                              label,
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
      ),
    );
  }
}
