import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class VoucherNotUsed extends StatefulWidget {
  const VoucherNotUsed({Key? key}) : super(key: key);

  @override
  State<VoucherNotUsed> createState() => _VoucherNotUsedState();
}

class _VoucherNotUsedState extends State<VoucherNotUsed> {
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
          color: MyColor.colorGreen,
        )
      ),
    );
  }
}
