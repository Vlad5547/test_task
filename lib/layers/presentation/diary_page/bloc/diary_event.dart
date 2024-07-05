import 'package:equatable/equatable.dart';

abstract class DiaryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeelingSelected extends DiaryEvent {
  final String feeling;

  FeelingSelected(this.feeling);

  @override
  List<Object?> get props => [feeling];
}

class GridItemSelected extends DiaryEvent {
  final String item;

  GridItemSelected(this.item);

  @override
  List<Object?> get props => [item];
}

class StressLevelChanged extends DiaryEvent {
  final double stressLevel;

  StressLevelChanged(this.stressLevel);

  @override
  List<Object?> get props => [stressLevel];
}

class SelfRatingChanged extends DiaryEvent {
  final double selfRating;

  SelfRatingChanged(this.selfRating);

  @override
  List<Object?> get props => [selfRating];
}

class NotesChanged extends DiaryEvent {
  final String notes;

  NotesChanged(this.notes);

  @override
  List<Object?> get props => [notes];
}
