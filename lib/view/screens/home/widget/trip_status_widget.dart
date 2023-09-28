import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:bed3aDelivery/controller/menu_controller.dart';
import 'package:bed3aDelivery/controller/order_controller.dart';
import 'package:bed3aDelivery/controller/profile_controller.dart';
import 'package:bed3aDelivery/utill/dimensions.dart';
import 'package:bed3aDelivery/utill/images.dart';
import 'package:bed3aDelivery/utill/styles.dart';
import 'package:bed3aDelivery/view/screens/dashboard/dashboard_screen.dart';

class TripStatusWidget extends StatelessWidget {
  final Function(int index) onTap;
  const TripStatusWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeExtraSmall),
      child: GetBuilder<ProfileController>(
        builder: (profileController) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Padding(
              padding:  EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
              child: Text('order_status'.tr,style:  rubikMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                  color: Theme.of(context).colorScheme.secondary)),
            ),
            GestureDetector(
              onTap: ()=> Get.to(()=> const DashboardScreen(pageIndex: 1)),
              child: TripItem(color: Color(0xFFd0dff6),color1: Color(0xFFeff6ff),icon: Images.waiting,
                  title: 'pending', totalCount: profileController.profileModel != null?
                profileController.profileModel!.totalDelivery??0 : 0,
                onTap: (){
                Get.find<BottomMenuController>().selectOrderHistoryScreen(fromHome: true);
                Get.find<OrderController>().setOrderTypeIndex(0);
                onTap(1);
                },),
            ),

            TripItem(color:Color(0xFFf2e4b7),color1: Color(0xFFf4f7dd), icon: Images.pending,
                title: 'Preparing',totalCount: profileController.profileModel!.pendingDelivery,
              onTap: ()
                {
                 Get.find<BottomMenuController>().selectOrderHistoryScreen(fromHome: true);
                 onTap(1);
                  Get.find<OrderController>().setOrderTypeIndex(2, reload: true);
                }
            ),

            TripItem(color: Color(0xFFc6f3de),color1: Color(0xFFe4fcef),icon: Images.assigned,
                title: 'in_way', totalCount: profileController.profileModel!.completedDelivery,
              onTap: (){
                Get.find<BottomMenuController>().selectOrderHistoryScreen(fromHome: true);
                onTap(1);
                Get.find<OrderController>().setOrderTypeIndex(3, reload: true);
              }),
            TripItem(color: Color(0xFF13ea60),color1: Color(0xFFffaf),icon: Images.completed,
                title: 'delivered', totalCount: profileController.profileModel!.completedDelivery,
              onTap: (){
                Get.find<BottomMenuController>().selectOrderHistoryScreen(fromHome: true);
                onTap(1);
                Get.find<OrderController>().setOrderTypeIndex(3, reload: true);
              }),
            TripItem(color: Color(0xFFbbbbbb),color1: Color(0xFFe4e4e4),icon: Images.cancel,
                title: 'refuese_recive', totalCount: profileController.profileModel!.completedDelivery,
              onTap: (){
                Get.find<BottomMenuController>().selectOrderHistoryScreen(fromHome: true);
                onTap(1);
                Get.find<OrderController>().setOrderTypeIndex(3, reload: true);
              }),


          ],);
        }
      ),
    );
  }
}

class TripItem extends StatelessWidget {
  final Color? color;
  final Color? color1;
  final String? icon;
  final String? title;
  final int? totalCount;
  final Function? onTap;
  const TripItem({Key? key, this.icon, this.title, this.totalCount, this.color, this.onTap, this.color1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Padding(
        padding:  EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
        child: Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          color: color),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
             Container(padding:  EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
               child: Row(children: [
                Padding(
              padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: SizedBox(width: 30,child: Image.asset(icon!)),
            ),
                Text(title!.tr, style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w400),),
               ],),),
              Padding(
            padding:  EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeSmall),
            child: Container(padding:  EdgeInsets.symmetric(vertical : Dimensions.paddingSizeDefault, horizontal: Dimensions.paddingSizeLarge),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              color: color1!
            ),child: Text(NumberFormat.compact().format(totalCount),style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),),
          )
        ],)),
      ),
    );
  }
}
