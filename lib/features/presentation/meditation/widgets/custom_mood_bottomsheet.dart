import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_state.dart';

void bottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    enableDrag: false,
    // isDismissible: false,
    // This allows the sheet to take up more space if needed
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return CustomMoodBottomSheet();
    },
  );
}

class CustomMoodBottomSheet extends StatefulWidget {
  const CustomMoodBottomSheet({super.key});

  @override
  State<CustomMoodBottomSheet> createState() => _CustomMoodBottomSheetState();
}

class _CustomMoodBottomSheetState extends State<CustomMoodBottomSheet> {
  var textFormController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodMessageBloc, MoodMessageState>(
        builder: (context, state) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.4,
        maxChildSize: 0.6,
        builder: (_, controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: textFormController,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<MoodMessageBloc>().add(FetchMoodMessageEvent(
                          'Today i need to be ${textFormController.text}'));
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  )
                ],
              ),
            ],
          );
        },
      );
    });
  }
}
