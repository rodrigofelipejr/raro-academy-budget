import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final void Function() reload;

  const CustomErrorWidget({
    Key? key,
    required this.message,
    required this.reload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
          ),
          //FIXME - alterar widget
          ElevatedButton(
            onPressed: reload,
            child: Text('TENTAR NOVAMENTE'),
          ),
        ],
      ),
    );
  }
}
