import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/main/bloc/story/story_cubit.dart';

class StoryDurationIndicator extends StatefulWidget {
  const StoryDurationIndicator({
    super.key,
    required this.width,
    required this.duration,
    required this.index,
  });

  final double width;
  final Duration duration;
  final int index;

  @override
  State<StoryDurationIndicator> createState() => _StoryDurationIndicatorState();
}

class _StoryDurationIndicatorState extends State<StoryDurationIndicator>
    with TickerProviderStateMixin {

  @override
  void initState() {
    final bloc = BlocProvider.of<StoryCubit>(context);
    if (bloc.controller == null) {
      AnimationController controller = AnimationController(
        vsync: this,
        duration: widget.duration,
      );
      bloc.setController(controller);
    }
    if (widget.index == bloc.currentStoryIndex) {
      bloc.controller!.addListener(() {
        if (widget.index == bloc.currentStoryIndex) {
          setState(() {});
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StoryCubit>(context);

    return BlocListener<StoryCubit, StoryState>(
      listener: (context, state) {
        final bloc = BlocProvider.of<StoryCubit>(context);
        if (bloc.controller == null) {
          AnimationController controller = AnimationController(
            vsync: this,
            duration: widget.duration,
          );
          bloc.setController(controller);
        }
        if (widget.index == bloc.currentStoryIndex) {
          bloc.controller!.addListener(() {
            if (widget.index == bloc.currentStoryIndex) {
              setState(() {});
            }
          });
        }
      },
      child: SizedBox(
        width: widget.width,
        child: LinearProgressIndicator(
            value: bloc.currentStoryIndex > widget.index ? 1 : bloc.controller!
                .value,
            minHeight: 2,
            borderRadius: BorderRadius.circular(1),
            backgroundColor: Colors.white.withOpacity(0.4),
            color: Colors.white),
      ),
    );
  }
}
