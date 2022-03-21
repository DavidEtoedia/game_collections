part of 'game_screen_shots_bloc.dart';

class ScreenShotEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetScreenShot extends ScreenShotEvent {
  final String screenShotId;
  GetScreenShot({
    required this.screenShotId,
  });

  @override
  List<Object?> get props => [screenShotId];
}
