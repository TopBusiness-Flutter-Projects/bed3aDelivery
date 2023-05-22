import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bed3aDelivery/controller/wallet_controller.dart';
import 'package:bed3aDelivery/view/base/custom_loader.dart';
import 'package:bed3aDelivery/view/base/no_data_screen.dart';
import 'package:bed3aDelivery/view/screens/wallet/widget/transaction_card_widget.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      builder: (walletController) {


        return !walletController.isLoading? walletController.deliveryWiseEarned.isNotEmpty?
        ListView.builder(
          itemCount: walletController.deliveryWiseEarned.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (transactionContext, transactionIndex){
          return TransactionCardWidget(orders: walletController.deliveryWiseEarned[transactionIndex]);
        }): const NoDataScreen(): CustomLoader(height: Get.height-600,);
      }
    );
  }
}
