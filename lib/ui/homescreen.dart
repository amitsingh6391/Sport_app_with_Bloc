import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sports/bloc/sportservices_bloc.dart';
import 'package:sports/utils/constants.dart';

import 'widgets/score_main_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );

    return Scaffold(
      body: BlocBuilder<SportservicesBloc, SportservicesState>(
        builder: (BuildContext context, state) {
          return state.map(
            intial: (_) => Center(
              child: Container(
                child: Text("initial"),
              ),
            ),
            loadInProgress: (_) => Center(
              child: Lottie.asset(loading),
            ),
            loadSuccess: (sportsData) => ScoreMainPage(
              sportData: sportsData.sportsData,
            ),
            loadFailure: (_) => Center(
              child: Lottie.asset(networkError),
            ),
            empty: (_) => Center(child: Text("we don't have any data")),
          );
        },
      ),
    );
  }
}
