part of 'achievements_bloc.dart';

class AchievementsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAchievements extends AchievementsEvent {
  final int achievementId;

  FetchAchievements(this.achievementId);
  @override
  List<Object?> get props => [achievementId];
}
