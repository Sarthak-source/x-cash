import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class VoucherUsed extends StatefulWidget {
  const VoucherUsed({Key? key}) : super(key: key);

  @override
  State<VoucherUsed> createState() => _VoucherUsedState();
}

class _VoucherUsedState extends State<VoucherUsed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
          itemBuilder: (context, index) => Container(
            height: 45,
            width: MediaQuery.of(context).size.height,
            color: MyColor.colorRed,
          )
      ),
    );
  }
}
