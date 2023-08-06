import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bed3aDelivery/controller/localization_controller.dart';
import 'package:bed3aDelivery/data/model/response/userinfo_model.dart';
import 'package:bed3aDelivery/utill/dimensions.dart';
import 'package:bed3aDelivery/utill/images.dart';
import 'package:bed3aDelivery/view/screens/profile/edit_profile_screen.dart';
import 'package:bed3aDelivery/view/screens/profile/widget/profile_info_widget.dart';



class ProfileHeaderWidget extends StatelessWidget {
  final UserInfoModel? profileModel;
  const ProfileHeaderWidget({Key? key, this.profileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding:  EdgeInsets.only(top: Dimensions.paddingSizeSmall),

      color: Theme.of(context).canvasColor,
      alignment: Alignment.center,
      child:Stack(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            margin:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            decoration: BoxDecoration(
              color: Get.isDarkMode? Theme.of(context).cardColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 900 : 200]!,
                  spreadRadius: 0.5, blurRadius: 0.3)]),

          ),
          Container(width: MediaQuery.of(context).size.width, height: 120,
            decoration: BoxDecoration(color: Theme.of(context).cardColor.withOpacity(.10),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width/2.5))
            ),),
          Positioned(child: Align(
            alignment: Alignment.centerLeft,
              child: ProfileInfoWidget(profileModel: profileModel))),

          Get.find<LocalizationController>().isLtr ?
          Positioned(right: 30,top: 20,
              child: InkWell(
                  onTap: (){

                    Get.to(()=> const ProfileEditScreen());
                  },
                  child: SizedBox(width: 30, child: Image.asset(Images.editIcon)))):
          Positioned(left: 30,top: 20,
              child: InkWell(
                  onTap: (){

                    Get.to(()=> const ProfileEditScreen());
                  },
                  child: SizedBox(width: 30, child: Image.asset(Images.editIcon))))
        ],
      ),
    );

  }
}


