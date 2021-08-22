// import 'package:flutter/material.dart';

// import '../../../shared/constants/app_gradients.dart';
// import '../../../shared/constants/constants.dart';
// import '../../../shared/utils/utils.dart';
// import '../../../shared/widgets/widgets.dart';

// class AppBarWithDrawer extends StatelessWidget with PreferredSizeWidget {
//   final Size preferredSize;
//   final String title;

//   AppBarWithDrawer({Key? key, required this.title})
//       : preferredSize = Size.fromHeight(180.0),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(
//         minHeight: screenHeightPercentage(context) * 0.25,
//         maxHeight: 180,
//       ),
//       height: screenHeight(context),
//       decoration: BoxDecoration(
//         gradient: AppGradients.blueGradientAppBar,
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: screenWidth(context),
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 3.0, top: 5.0),
//                 child: ButtonIconWidget(
//                   child: Icon(
//                     Icons.menu,
//                     color: AppColors.white,
//                   ),
//                   onTap: () => Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//             ),
//             SizedBox(height: screenHeightPercentage(context) * 0.02),
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 title,
//                 style: AppTextStyles.white26w700Roboto,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
