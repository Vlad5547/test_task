import 'package:equatable/equatable.dart';

class DiaryState extends Equatable {
  final String? selectedFeeling;
  final String? selectedGridItem;
  final double stressLevel;
  final double selfRating;
  final String notes;

  final Map<String, List<String>> gridItems = {
    'Радость': [
      'Возбуждение',
      'Восторг',
      'Игривость',
      'Наслаждение',
      'Очарование',
      'Осознанность',
      'Смелость',
      'Удовольствие',
      'Чувственность',
      'Энергичность',
      'Экстравагантность',
    ],
    'Страх': [
      'Тревога',
      'Ужас',
      'Фобия',
      'Опасение',
      'Недоверие',
      'Уныние',
    ],
    'Бешенство': [
      'Ярость',
      'Неистовство',
      'Агрессия',
      'Злость',
      'Свирепость',
    ],
    'Грусть': [
      'Печаль',
      'Тоска',
      'Скорбь',
      'Уныние',
      'Депрессия',
    ],
    'Спокойствие': [
      'Умиротворение',
      'Смирение',
      'Величие',
      'Безмятежност',
      'Апатия',
    ],
    'Сила': [
      'Мощь',
      'Власть',
      'Энергичность',
      'Упорство',
      'Неустрашимость',
    ],
  };

  DiaryState({
    this.selectedFeeling,
    this.selectedGridItem,
    this.stressLevel = 0,
    this.selfRating = 0,
    this.notes = '',
  });

  @override
  List<Object?> get props => [selectedFeeling, selectedGridItem, stressLevel, selfRating, notes];

  DiaryState copyWith({
    String? selectedFeeling,
    String? selectedGridItem,
    double? stressLevel,
    double? selfRating,
    String? notes,
  }) {
    return DiaryState(
      selectedFeeling: selectedFeeling ?? this.selectedFeeling,
      selectedGridItem: selectedGridItem ?? this.selectedGridItem,
      stressLevel: stressLevel ?? this.stressLevel,
      selfRating: selfRating ?? this.selfRating,
      notes: notes ?? this.notes,
    );
  }
}
