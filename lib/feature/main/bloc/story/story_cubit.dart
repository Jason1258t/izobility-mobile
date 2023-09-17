import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:izobility_mobile/models/story.dart';
import 'package:meta/meta.dart';

part 'story_state.dart';

final List<Story> stories = [
  Story(
      title: 'Espresso is here!',
      subtitle:
          'Get ready spro bros - its time to brew the espresso you dream about.',
      imageUrl:
          'https://img3.akspic.ru/crops/6/4/2/8/6/168246/168246-skazhi_igru-lyudo_king-kosti-igra_v_kosti-azartnaya_igra-1407x3045.jpg',
      duration: const Duration(seconds: 10)),
  Story(
      title: 'Абобус is here!',
      subtitle:
          'Get ready spro bros - its time to brew the espresso you dream about.',
      imageUrl:
          'https://neyrosety.ru/wp-content/uploads/2023/03/00505-1011766434-576x1024.jpg',
      buttonUrl: 'https://pub.dev/packages/url_launcher',
      duration: const Duration(seconds: 10))
];

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial());

  AnimationController? controller;
  int currentStoryIndex = 0;
  int storiesCount = stories.length;

  List<Story> storiesList = stories;

  bool paused = false;

  void playPause() {
    if (paused) {
      controller!
        ..forward(from: controller!.value)
        ..repeat();
    } else {
      controller!.stop();
    }
    paused = !paused;
  }

  void controllerListener() {
    log(controller!.status.toString());
    if (controller!.value > 0.99) {
      changeStory();
    }
  }

  void initController(AnimationController newController) {
    controller = newController;
    changeStory(index: 0);
  }

  void changeStory({int? index}) {
    currentStoryIndex = index ?? currentStoryIndex + 1;
    if (currentStoryIndex >= storiesCount) {
      controller!.stop();
      currentStoryIndex = 0;
      emit(EndOfStories());
    } else {
      controller!.value = 0;
      controller!.duration = storiesList[currentStoryIndex].duration;
      controller!.repeat();

      emit(ChangeStory());
    }
  }

  void dispose() {
    controller = null;
    currentStoryIndex = 0;
    emit(ChangeStory());
  }
}
