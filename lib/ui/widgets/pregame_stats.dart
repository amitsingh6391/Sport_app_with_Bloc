import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports/models/sports_data.dart';

import 'package:sports/ui/theme/apptheme.dart';

import 'pre_game_stats_bottomsheet.dart';

class PregameStatsWidget extends StatelessWidget {
  const PregameStatsWidget({required this.sportData, Key? key})
      : super(key: key);

  final SportData sportData;

  @override
  Widget build(
    BuildContext context,
  ) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return GestureDetector(
      onTap: () {
        preGameStatsBottomSheet(context, sportData.games.first);
      },
      child: Container(
        height: 100.h,
        width: 0.4.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomRight: Radius.circular(50),
          ),
          color: Apptheme.goalsCardColor,
        ),
        child: Center(
          child: Text(
            "Pre Game stats",
            textAlign: TextAlign.center,
            style: Apptheme(context).boldText.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ),
      ),
    );
  }
}
