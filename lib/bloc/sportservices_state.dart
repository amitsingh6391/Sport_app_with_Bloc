part of 'sportservices_bloc.dart';

@freezed
class SportservicesState with _$SportservicesState {
  const factory SportservicesState.intial() = _intial;
  const factory SportservicesState.loadInProgress() = _loadInProgress;
  const factory SportservicesState.loadSuccess(SportData sportsData) =
      _loadSuccess;
  const factory SportservicesState.loadFailure() = _LoadFailure;

  const factory SportservicesState.empty() = _Empty;
}
