import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note(
      {Key? key,
      required this.title,
      required this.text,
      required this.color,
      required this.hasAttachment,
      required this.hasDate,
      required this.isFavorite,
      required this.dateString})
      : super(key: key);
  final String title;
  final String text;
  final String dateString;
  final Color color;
  final bool hasAttachment;
  final bool hasDate;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  boxShadow: kElevationToShadow[2],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (hasDate)
                      Icon(
                        Icons.date_range,
                        color: Colors.black.withOpacity(0.54),
                        size: 20,
                      ),
                    if (hasAttachment)
                      Icon(
                        Icons.attach_file_outlined,
                        color: Colors.black.withOpacity(0.54),
                        size: 20,
                      ),
                    if (isFavorite)
                      Icon(
                        Icons.favorite,
                        color: Colors.black.withOpacity(0.54),
                        size: 20,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 0, 0, 0.54)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Criação: ' + dateString,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      fontSize: 10,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 0, 0, 0.54)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
