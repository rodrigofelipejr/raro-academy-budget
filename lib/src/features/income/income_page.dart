import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(189),
        child: Container(
          height: 189,
          color: Colors.blue,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 49,
                  bottom: 115,
                  left: 16,
                  right: 319,
                ),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  iconSize: 25,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 95,
                  bottom: 62,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Entrada",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                      // height: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text("Income"),
      ),
    );
  }
}
