import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bed3aDelivery/controller/chat_controller.dart';
import 'package:bed3aDelivery/utill/dimensions.dart';
import 'package:bed3aDelivery/utill/styles.dart';

class ChatTypeButton extends StatelessWidget {
  final String text;
  final int index;
  const ChatTypeButton({Key? key, required this.text, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<ChatController>().setUserTypeIndex(index);
      },
      child: GetBuilder<ChatController>(builder: (chat) {
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall,
              vertical: chat.userTypeIndex == index ?  Dimensions.fontSizeExtraSmall: Dimensions.paddingSizeChat),
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: chat.userTypeIndex == index ?
              Theme.of(context).cardColor : Theme.of(context).primaryColor.withOpacity(.55),
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeOverLarge),
            ),
            child: Text(text, style: chat.userTypeIndex == index ?
            rubikMedium.copyWith(color: chat.userTypeIndex == index ?
            Get.isDarkMode ? Colors.white:Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyLarge as Color?):
            rubikRegular.copyWith(color: chat.userTypeIndex == index ?
            Theme.of(context).cardColor : Theme.of(context).cardColor.withOpacity(.8),
            fontSize: chat.userTypeIndex == index ? Dimensions.fontSizeDefault : Dimensions.fontSizeSmall)),
          ),
        );
      },
      ),
    );
  }
}