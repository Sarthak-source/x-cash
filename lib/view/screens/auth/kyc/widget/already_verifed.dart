import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';


class AlreadyVerifiedWidget extends StatefulWidget {
  final bool isPending;
  const AlreadyVerifiedWidget({Key? key,this.isPending=false}) : super(key: key);

  @override
  State<AlreadyVerifiedWidget> createState() => _AlreadyVerifiedWidgetState();
}

class _AlreadyVerifiedWidgetState extends State<AlreadyVerifiedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:  const EdgeInsets.all(Dimensions.space20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColor.screenBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.isPending ? MyImages.pendingIcon : MyImages.verifiedIcon,height: 100,width: 100,fit: BoxFit.cover,),
          const SizedBox(height: 25,),
          Text(widget.isPending?MyStrings.kycUnderReviewMsg:MyStrings.kycAlreadyVerifiedMsg,style: regularDefault.copyWith(color: MyColor.colorBlack,fontSize: Dimensions.fontExtraLarge,)),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }
}
