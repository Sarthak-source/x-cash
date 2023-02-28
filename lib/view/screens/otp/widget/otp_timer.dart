import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';

class OtpTimer extends StatefulWidget {
  final VoidCallback onTimeComplete;
  final int duration;
  const OtpTimer({Key? key,required this.onTimeComplete,this.duration = 12}) : super(key: key);

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {

  Timer? _timer;
  int _counter = 0;
  bool isTimeEnd = false;

  @override
  void initState() {
    super.initState();
    _counter = widget.duration;
    _startTimer();
  }




  _startTimer(){
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter == 0) {
        widget.onTimeComplete();
        isTimeEnd = true;
      } else {
        setState(() {
          _counter--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isTimeEnd ? const Text(''):Text(MyStrings.otpExpiredMsg.tr, maxLines: 2, textAlign: TextAlign.center,style: regularDefault.copyWith(color: MyColor.labelTextColor)),
        const SizedBox(height: Dimensions.space20),
        SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: _counter/widget.duration,
                backgroundColor: MyColor.colorRed.withOpacity(0.3),
                strokeWidth: 8,
                valueColor: const AlwaysStoppedAnimation(MyColor.primaryColor),
              ),
              Center(
                child: Text('${_counter.toString()}\n${MyStrings.sec}',textAlign:TextAlign.center,style: semiBoldLarge.copyWith(color: Colors.black)),
              )
            ],
          ),
        ),
      ],
    );
  }
}