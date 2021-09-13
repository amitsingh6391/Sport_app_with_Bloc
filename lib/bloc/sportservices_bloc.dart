import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:sports/models/sports_data.dart';
import 'package:sports/utils/constants.dart';

part 'sportservices_event.dart';
part 'sportservices_state.dart';
part 'sportservices_bloc.freezed.dart';

class SportservicesBloc extends Bloc<SportservicesEvent, SportservicesState> {
  SportservicesBloc() : super(SportservicesState.intial());

  @override
  Stream<SportservicesState> mapEventToState(
    SportservicesEvent event,
  ) async* {
    yield* event.map(getSportsData: (e) async* {
      yield const SportservicesState.loadInProgress();

      SportData sportData = SportData.fromJson(intialJson);
      try {
        final response = await Dio().get(ApiUrl);

        print("i m in serviexs");
        print(response.data);

        sportData = SportData.fromJson(response.data);
        yield SportservicesState.loadSuccess(sportData);
      } catch (e) {
        print(e);
        yield const SportservicesState.loadFailure();
      }
    });
  }
}
