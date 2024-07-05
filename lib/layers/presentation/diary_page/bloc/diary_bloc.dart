import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_event.dart';
import 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryState()) {
    on<FeelingSelected>((event, emit) async {
      emit(
        state.copyWith(
          selectedFeeling: event.feeling,
        ),
      );
    });
    on<GridItemSelected>((event, emit) async {
      emit(
        state.copyWith(
          selectedGridItem: event.item,
        ),
      );
    });
    on<StressLevelChanged>((event, emit) async {
      emit(
        state.copyWith(
          stressLevel: event.stressLevel,
        ),
      );
    });
    on<SelfRatingChanged>((event, emit) async {
      emit(
        state.copyWith(
          selfRating: event.selfRating,
        ),
      );
    });
    on<NotesChanged>((event, emit) async {
      emit(
        state.copyWith(
          notes: event.notes,
        ),
      );
    });
  }
}
