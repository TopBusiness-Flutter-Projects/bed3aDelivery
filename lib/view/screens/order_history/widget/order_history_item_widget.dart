import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bed3aDelivery/controller/localization_controller.dart';
import 'package:bed3aDelivery/data/model/response/order_model.dart';
import 'package:bed3aDelivery/helper/date_converter.dart';
import 'package:bed3aDelivery/utill/dimensions.dart';
import 'package:bed3aDelivery/utill/images.dart';
import 'package:bed3aDelivery/utill/styles.dart';
import 'package:bed3aDelivery/view/screens/order/order_details_screen.dart';
import 'package:bed3aDelivery/view/screens/order/widget/cal_chat_widget.dart';
import 'package:bed3aDelivery/view/screens/order/widget/customer_info_widget.dart';


class OrderHistoryItemWidget extends StatelessWidget {
  final OrderModel? orderModel;
  const OrderHistoryItemWidget({Key? key, this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(OrderDetailsScreen(orderModel: orderModel)),
      child: Padding(
        padding:  EdgeInsets.only(left: Dimensions.paddingSizeSmall, bottom : Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
        child: Container(
          padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(color: Theme.of(context).cardColor,
            boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(.125),
                spreadRadius: .7, blurRadius: 2, offset: const Offset(0, 1))],
            borderRadius: BorderRadius.circular(10)),


          child: Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Get.find<LocalizationController>().isLtr? Alignment.topRight: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: Get.find<LocalizationController>().isLtr? Get.context!.width<= 400? 170 : 170 :Get.context!.width<= 400? 140 : 160,
                      child: Column(children: [
                        Row(children: [
                          Row(
                            children: [
                              Text('${'assigned'.tr} : ',style: rubikRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                              Text(DateConverter.isoStringToLocalDateOnly(orderModel!.createdAt!), style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                            ],
                          ),
                           SizedBox(width: Dimensions.paddingSizeSmall),
                          SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.calenderIcon,
                              color: Theme.of(context).primaryColor.withOpacity(.5)))
                        ],),
                        orderModel!.expectedDate != null?
                        Padding(
                          padding:  EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
                          child: Row(
                            children: [
                              Text('${'expected_date'.tr} : ',
                                style: rubikRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                              Text('10-01-2023', style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                            ],
                          ),
                        ): const SizedBox(),
                        Padding(
                          padding:  EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
                          child: Row(
                            children: [
                              Text('${'المورد : '} : ',
                                style: rubikRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                              Text('شركة الزهران 2 للتجارة', style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                            ],
                          ),
                        )

                      ]),
                    ),
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 3,top: Dimensions.paddingSizeMin),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Container(
                          width:MediaQuery.of(context).size.width/2.8,
                          decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radiusSmall))
                          ),
                          child: Center(
                            child: Text('${orderModel!.orderAmount}ج.م',
                                style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: Colors.white)),
                          ),
                        ),



                      ]),
                    ),
                    Padding(
                      padding:  EdgeInsets.fromLTRB( Dimensions.paddingSizeMin,
                          Dimensions.paddingSizeMin, Dimensions.paddingSizeMin, 0),
                      child: CustomerInfoWidget(orderModel: orderModel, showCustomerImage: true),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -10, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                        child: CallAndChatWidget(orderModel: orderModel),
                      ),
                    ),

              ]),
            ],
          ),
        ),
      ),
    );
  }
}
