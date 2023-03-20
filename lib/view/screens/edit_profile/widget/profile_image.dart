import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xcash_app/view/components/circle_image_button.dart';

import '../../../../../../../../core/utils/my_color.dart';
import '../../../../../../../core/utils/my_images.dart';
import '../../../../../data/controller/account/profile_controller.dart';


class ProfileWidget extends StatefulWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final bool isEdit;

  const ProfileWidget({Key? key,
    required this.imagePath,
    required this.onClicked,
    this.isEdit = false,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            !widget.isEdit?buildDefaultImage():buildImage(),
            widget.isEdit?Positioned(
              bottom: 0,
              right: -4,
              child: GestureDetector(
                  onTap: (){
                   _openGallery(context);
                  },
                  child: buildEditIconMethod(MyColor.primaryColor)
              ),
            ):const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    final  Object image;

    if(imageFile!=null){
      image = FileImage(File(imageFile!.path));
    }else if (widget.imagePath.contains('http')) {
      image = NetworkImage(widget.imagePath);
    } else{
      image = const AssetImage(MyImages.profile);
    }

    bool isAsset=widget.imagePath.contains('http')==true?false:true;


    return Container(
      decoration:  BoxDecoration(
        shape:  BoxShape.circle,
        border: Border.all(color: MyColor.screenBgColor,width: 1),
      ),
      child: ClipOval(
        child: Material(
          color: MyColor.getCardBgColor(),
          child:imageFile!=null?
          Ink.image(
            image: image as ImageProvider,
            fit: BoxFit.cover,
            width: 90,
            height: 90,
            child: InkWell(
              onTap: widget.onClicked,
            ),
          ):CircleImageWidget(
            press: (){},
            isAsset: isAsset,
            imagePath: isAsset?MyImages.profile:widget.imagePath,
            height: 100,
            width: 100,),
        ),
      ),
    );
  }

  Widget buildDefaultImage() {

    return const ClipOval(
      child: Material(
          color: MyColor.transparentColor,
          child: CircleImageWidget(
            imagePath: MyImages.profile,
            width: 90,
            height: 90,
            isAsset: true,
          )
      ),
    );
  }

  Widget buildEditIconMethod(Color color) =>
      buildCircle(
          child: buildCircle(
              child: Icon(
                widget.isEdit ? Icons.add_a_photo : Icons.edit,
                color: Colors.white,
                size: 20,
              ),
              all: 8,
              color: color),
          all: 3,
          color: Colors.white
      );


  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }

  void _openGallery(BuildContext context) async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg',]);
    /*final pickedFile = await FilePicker.pickImage(
      source: ImageSource.gallery ,
    );*/
    setState(() {
      Get.find<ProfileController>().imageFile= File(result!.files.single.path!);
      imageFile = XFile(result.files.single.path!);
    });


  }

}




