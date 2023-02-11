import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class OtpTimer extends StatefulWidget {
  final VoidCallback onTimeComplete;
  const OtpTimer({Key? key,required this.onTimeComplete}) : super(key: key);

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 180,
      initialDuration: 180,
      controller: CountDownController(),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: MyColor.primaryColor,
      fillGradient: null,
      backgroundColor: MyColor.transparentColor,
      backgroundGradient: null,
      strokeWidth: 8.0,
      strokeCap: StrokeCap.round,
      textStyle: regularOverLarge.copyWith(color: MyColor.primaryColor, fontWeight: FontWeight.w500),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: widget.onTimeComplete,
      onChange: (String timeStamp) {
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Start";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
