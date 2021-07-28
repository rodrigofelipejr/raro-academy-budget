import 'dart:ui';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';

class NoteModel {
  final String title;
  final String text;
  final String dateString;
  final Color color;
  final bool hasAttachment;
  final bool hasDate;
  final bool isFavorite;
  NoteModel({
    required this.title,
    required this.text,
    required this.dateString,
    required this.color,
    required this.hasAttachment,
    required this.hasDate,
    required this.isFavorite,
  });

  static getList() {
    return [
      NoteModel(
          title: 'Não esquecer',
          text:
              'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed  incididunt ut labore et dolore aliqua.',
          color: AppColors.rosa,
          hasDate: true,
          hasAttachment: true,
          isFavorite: true,
          dateString: '08/07/21'),
      NoteModel(
          title: 'Reunião com os stakeholders',
          text:
              'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Sed do eiusmod tempor incidi. Ut labore et dolore magna aliqua.',
          color: AppColors.verde,
          hasDate: false,
          hasAttachment: true,
          isFavorite: false,
          dateString: '07/07/21'),
      NoteModel(
        title: 'Lembretes para o médico',
        text:
            'Lorem ipsum dolor , consectetur adicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore dolore.',
        color: AppColors.roxo,
        hasDate: true,
        hasAttachment: true,
        isFavorite: true,
        dateString: '06/07/21',
      ),
      NoteModel(
        title: 'Ideias para o novo app 2022',
        text:
            'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore dolore.',
        color: AppColors.ciano,
        hasDate: false,
        hasAttachment: false,
        isFavorite: false,
        dateString: '06/07/21',
      ),
      NoteModel(
        title: 'Reunião do grupo de treinamento',
        text:
            'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore dolore.',
        color: AppColors.amarelo,
        hasDate: false,
        hasAttachment: false,
        isFavorite: false,
        dateString: '06/07/21',
      ),
      NoteModel(
        title: 'Não esquecer',
        text:
            'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed  incididunt ut labore et dolore aliqua.',
        color: AppColors.rosa,
        hasDate: true,
        hasAttachment: true,
        isFavorite: true,
        dateString: '06/07/21',
      ),
      NoteModel(
        title: 'Reunião com os stakeholders',
        text:
            'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore et dolore magna aliqua.',
        color: AppColors.verde,
        hasDate: false,
        hasAttachment: true,
        isFavorite: false,
        dateString: '06/07/21',
      ),
      NoteModel(
        title: 'Lembretes para o médico',
        text:
            'Lorem ipsum dolor , consectetur adicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        color: AppColors.roxo,
        hasDate: true,
        hasAttachment: true,
        isFavorite: true,
        dateString: '06/07/21',
      ),
      NoteModel(
        title: 'Ideias para o novo app 2022',
        text:
            'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore dolore.',
        color: AppColors.ciano,
        hasDate: false,
        hasAttachment: false,
        isFavorite: false,
        dateString: '06/07/21',
      ),
      NoteModel(
        title: 'Reunião do grupo de treinamento',
        text:
            'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore dolore.',
        color: AppColors.amarelo,
        hasDate: false,
        hasAttachment: false,
        isFavorite: false,
        dateString: '06/07/21',
      ),
    ];
  }
}
