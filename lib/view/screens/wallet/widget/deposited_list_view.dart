import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bed3aDelivery/controller/wallet_controller.dart';
import 'package:bed3aDelivery/view/base/custom_loader.dart';
import 'package:bed3aDelivery/view/base/no_data_screen.dart';
import 'package:bed3aDelivery/view/screens/wallet/widget/deposited_card_widget.dart';

class DepositedListView extends StatelessWidget {
  const DepositedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
        builder: (walletController) {

          return !walletController.isLoading? walletController.depositedList.isNotEmpty?
          ListView.builder(
              itemCount: walletController.depositedList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                return DepositedCardWidget(deposit: walletController.depositedList[index]);
              }): const NoDataScreen(): CustomLoader(height: Get.height-600,);
        }
    );
  }
}
