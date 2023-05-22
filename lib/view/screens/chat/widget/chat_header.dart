import 'package:flutter/material.dart';
import 'package:bed3aDelivery/controller/chat_controller.dart';
import 'package:bed3aDelivery/controller/localization_controller.dart';
import 'package:bed3aDelivery/utill/dimensions.dart';
import 'package:bed3aDelivery/view/base/custom_search_widget.dart';
import 'package:bed3aDelivery/view/screens/chat/widget/chat_type_button.dart';
import 'package:get/get.dart';

class ChatHeader extends StatefulWidget {
  const ChatHeader({Key key}) : super(key: key);

  @override
  State<ChatHeader> createState() => _ChatHeaderState();
}

class _ChatHeaderState extends State<ChatHeader> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        builder: (chat) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeExtraLarge),
            child: Container(height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(Dimensions.flagSize),
                ),
                child: Stack(
                  children: [
                    Positioned(

                      child: Align(
                        alignment: Get.find<LocalizationController>().isLtr? Alignment.centerRight : Alignment.centerLeft,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            ChatTypeButton(text: 'seller'.tr, index: 0),
                            ChatTypeButton(text: 'customer'.tr, index: 1),
                            ChatTypeButton(text: 'admin'.tr, index: 3),
                          ],
                        ),
                      ),
                    ),
                    AnimSearchBar(

                      width: MediaQuery.of(context).size.width,
                      textController: _textEditingController,
                      onSuffixTap: () {
                        _textEditingController.clear();
                      },
                      color: Theme.of(context).cardColor,
                      helpText: "Search Text...",
                      autoFocus: true,
                      closeSearchOnSuffixTap: true,
                      onChanged: (value){
                        if(value != null){
                          chat.searchConversationList(value);
                        }
                      },
                      animationDurationInMilli: 200,
                      rtl: !Get.find<LocalizationController>().isLtr,
                    ),
                  ],
                )),
          );
        }
    );
  }
}
