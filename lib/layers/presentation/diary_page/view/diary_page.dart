import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_screen/layers/presentation/app_colors.dart';
import 'package:test_task_screen/layers/presentation/app_style.dart';

import '../../constants.dart';
import '../bloc/diary_bloc.dart';
import '../bloc/diary_event.dart';
import '../bloc/diary_state.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryBloc(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<DiaryBloc, DiaryState>(
                builder: (context, state) {
                  return Feelings(
                    selectedFeeling: state.selectedFeeling,
                    onFeelingSelected: (feeling) {
                      context.read<DiaryBloc>().add(FeelingSelected(feeling));
                    },
                  );
                },
              ),
              const SizedBox(
                height: 35,
              ),
              BlocBuilder<DiaryBloc, DiaryState>(
                builder: (context, state) {
                  var gridItems = context.read<DiaryBloc>().state.gridItems;
                  if (state.selectedFeeling != null) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3,
                      ),
                      itemCount: gridItems[state.selectedFeeling]!.length,
                      itemBuilder: (context, index) {
                        final item = gridItems[state.selectedFeeling]![index];
                        return GestureDetector(
                          onTap: () {
                            context.read<DiaryBloc>().add(
                                GridItemSelected(item));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: state.selectedGridItem == item
                                  ? AppColors.orangeColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: Constants.shadow,
                            ),
                            child: Center(
                              child: Text(
                                item,
                                style: state.selectedGridItem == item
                                    ? AppStyle.enableFeelingCardStyle
                                    : AppStyle.disableFeelingCardStyle,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(); // Возвращаем пустой контейнер или другой виджет, если selectedFeeling равен null
                  }
                },
              ),


              const SizedBox(
                height: 35,
              ),
              const SliderLogic(
                startText: 'Низкий',
                endText: 'Высокий',
                header: 'Уровень стресса',
                restorationId: 'stress',
              ),
              const SizedBox(
                height: 35,
              ),
              const SliderLogic(
                startText: 'Неуверенность',
                endText: 'Уверенность',
                header: 'Самооценка',
                restorationId: 'self-rating',
              ),
              const SizedBox(
                height: 35,
              ),
              const Notes(),
              const SizedBox(
                height: 20,
              ),
              const SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class Feelings extends StatelessWidget {
  const Feelings({
    super.key,
    required this.selectedFeeling,
    required this.onFeelingSelected,
  });

  final String? selectedFeeling;
  final ValueChanged<String> onFeelingSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Что чувствуешь?',
          style: AppStyle.textStyleBlack,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FeelingCard(
                text: 'Радость',
                imagePath: 'assets/images/hapiness.png',
                isSelected: selectedFeeling == 'Радость',
                onTap: () => onFeelingSelected('Радость'),
              ),
              FeelingCard(
                text: 'Страх',
                imagePath: 'assets/images/fear.png',
                isSelected: selectedFeeling == 'Страх',
                onTap: () => onFeelingSelected('Страх'),
              ),
              FeelingCard(
                text: 'Бешенство',
                imagePath: 'assets/images/rage.png',
                isSelected: selectedFeeling == 'Бешенство',
                onTap: () => onFeelingSelected('Бешенство'),
              ),
              FeelingCard(
                text: 'Грусть',
                imagePath: 'assets/images/sadness.png',
                isSelected: selectedFeeling == 'Грусть',
                onTap: () => onFeelingSelected('Грусть'),
              ),
              FeelingCard(
                text: 'Спокойствие',
                imagePath: 'assets/images/calm.png',
                isSelected: selectedFeeling == 'Спокойствие',
                onTap: () => onFeelingSelected('Спокойствие'),
              ),
              FeelingCard(
                text: 'Сила',
                imagePath: 'assets/images/power.png',
                isSelected: selectedFeeling == 'Сила',
                onTap: () => onFeelingSelected('Сила'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FeelingCard extends StatelessWidget {
  const FeelingCard({
    super.key,
    required this.text,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(76),
            ),
            boxShadow: Constants.shadow,
            border: isSelected
                ? Border.all(color: AppColors.orangeColor, width: 2)
                : null,
          ),
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: 75,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderLogic extends StatefulWidget {
  const SliderLogic({super.key,
    required this.startText,
    required this.endText,
    required this.header,
    required this.restorationId});

  final String startText;
  final String endText;
  final String header;
  final String restorationId;

  @override
  State<SliderLogic> createState() => _SliderLogicState();
}

class _SliderLogicState extends State<SliderLogic> with RestorationMixin {
  final RestorableDouble _discreteValue = RestorableDouble(20);

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_discreteValue, 'discrete_value');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.header,
          style: AppStyle.textStyleBlack,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding:
          const EdgeInsets.only(bottom: 15, right: 10, left: 10, top: 15),
          decoration: const BoxDecoration(
              boxShadow: Constants.shadow,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                value: _discreteValue.value,
                min: 0,
                max: 100,
                divisions: 5,
                activeColor: AppColors.orangeColor,
                inactiveColor: AppColors.greySliderColor,
                label: _discreteValue.value.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _discreteValue.value = value;
                  });
                  if (widget.restorationId == 'stress') {
                    context.read<DiaryBloc>().add(StressLevelChanged(value));
                  } else if (widget.restorationId == 'self-rating') {
                    context.read<DiaryBloc>().add(SelfRatingChanged(value));
                  }
                },
              ),
              Row(
                children: [
                  Expanded(child: Text(
                    widget.startText, style: AppStyle.textSliderStyle,)),
                  Text(widget.endText, style: AppStyle.textSliderStyle,),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => widget.restorationId;
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Заметки',
          style: AppStyle.textStyleBlack,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            boxShadow: Constants.shadow,
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          child: BlocBuilder<DiaryBloc, DiaryState>(
            builder: (context, state) {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'Введите заметку',
                  border: InputBorder.none,
                  hintStyle: AppStyle.textFieldStyle,
                ),
                minLines: 3,
                maxLines: 3,
                onChanged: (note) {
                  context.read<DiaryBloc>().add(NotesChanged(note));
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryBloc, DiaryState>(
      builder: (context, state) {
        // Проверяем условия для активности кнопки

        bool isButtonEnabled = state.selectedFeeling != null && state.notes.isNotEmpty && state.selectedGridItem != null;

        return Center(
          child: SizedBox(
            width: double.infinity,
            height: 44,
            child: Container(
              decoration: BoxDecoration(
                color: isButtonEnabled ? AppColors.orangeColor : AppColors.disabledGreyColor,
                borderRadius: BorderRadius.circular(60.0),
              ),
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                  // Действие при нажатии на активную кнопку
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Popup'),
                        content: const Text('Кнопка Сохранить нажата!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
                    : null, // Кнопка неактивна, если условия не выполняются
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                ),
                child: const Text(
                  'Сохранить',
                  style: AppStyle.textStyleButton,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}