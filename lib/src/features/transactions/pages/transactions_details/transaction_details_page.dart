import '../../../../shared/stores/stores.dart';
import '../../../../shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/models/models.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../widgets/appbar_with_drawer.dart';
import 'stores/transaction_details_store.dart';
import 'widgets/widgets.dart';

class TransactionsDetailsPage extends StatefulWidget {
  final TransactionModel? transaction;
  // final TypeTransaction typeTransaction;

  const TransactionsDetailsPage({Key? key, this.transaction}) : super(key: key);

  @override
  _TransactionsDetailsPageState createState() => _TransactionsDetailsPageState();
}

class _TransactionsDetailsPageState extends ModularState<TransactionsDetailsPage, TransactionsDetailsStore>
    with KeyboardManager {
  late final AuthStore _authStore;

  @override
  void initState() {
    super.initState();

    _authStore = Modular.get<AuthStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
      ),
      extendBodyBehindAppBar: true,
      drawer: DrawerWidget(),
      body: FormInputWidget(),
    );
  }
}

//STUB - remover
// import '../../../../shared/stores/stores.dart';
// import '../../../../shared/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import '../../../../shared/constants/constants.dart';
// import '../../../../shared/models/models.dart';
// import '../../../../shared/widgets/widgets.dart';
// import '../../widgets/appbar_with_drawer.dart';
// import 'stores/transaction_details_store.dart';
// import 'widgets/widgets.dart';

// class TransactionsDetailsPage extends StatefulWidget {
//   final TransactionModel? transaction;
//   // final TypeTransaction typeTransaction;

//   const TransactionsDetailsPage({Key? key, this.transaction}) : super(key: key);

//   @override
//   _TransactionsDetailsPageState createState() => _TransactionsDetailsPageState();
// }

// class _TransactionsDetailsPageState extends ModularState<TransactionsDetailsPage, TransactionsDetailsStore>
//     with KeyboardManager {
//   late final AuthStore _authStore;

//   @override
//   void initState() {
//     super.initState();

//     _authStore = Modular.get<AuthStore>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWithDrawer(title: "Entrada"),
//       drawer: DrawerWidget(),
//       body: Column(
//         children: [
//           Expanded(
//             child: LayoutBuilder(
//               builder: (context, constraint) {
//                 return SingleChildScrollView(
//                   physics: ClampingScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minHeight: constraint.maxHeight),
//                     child: IntrinsicHeight(
//                       child: Container(
//                         padding: const EdgeInsets.all(16.0),
//                         child: CardWidget(
//                           contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: FormInputWidget(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SpaceBottomWidget(),
//         ],
//       ),
//     );
//   }
// }
