import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  late DropDownItemData _value = DropDownItemData(
    color: AppColors.rosa,
    value: "rosa",
  );

  final List<DropDownItemData> list = [
    DropDownItemData(
      color: AppColors.rosa,
      value: "rosa",
    ),
    DropDownItemData(
      color: AppColors.verde,
      value: "verde",
    ),
    DropDownItemData(
      color: AppColors.roxo,
      value: "roxo",
    ),
    DropDownItemData(
      color: AppColors.ciano,
      value: "ciano",
    ),
    DropDownItemData(
      color: AppColors.amarelo,
      value: "amarelo",
    ),
  ];

  @override
  void initState() {
    _value = list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset("assets/images/app_bar_logo.png"),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Título",
                            hintStyle: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              letterSpacing: 0.15,
                              color: Colors.black.withOpacity(0.54),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              letterSpacing: 0.15,
                              color: Colors.black.withOpacity(0.54),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      DropdownButton(
                        underline: Container(),
                        onChanged: (value) {
                          setState(() {
                            _value = value as DropDownItemData;
                          });
                        },
                        value: _value,
                        selectedItemBuilder: (BuildContext context) {
                          return list.map<Widget>((DropDownItemData item) {
                            return Center(
                              child: Container(
                                height: 18.0,
                                width: 18.0,
                                decoration: BoxDecoration(
                                  color: _value.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        focusColor: Colors.transparent,
                        items: list
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Center(
                                  child: Container(
                                    height: 18.0,
                                    width: 18.0,
                                    decoration: BoxDecoration(
                                      color: e.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  TextField(
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                      hintText: "Digite algo",
                      hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.15,
                        color: Colors.black.withOpacity(0.54),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0,
                ),
                child: SafeArea(
                  bottom: true,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file_outlined,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DropDownItemData {
  final Color color;
  final String value;

  DropDownItemData({
    required this.color,
    required this.value,
  });
}
