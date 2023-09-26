import 'package:flutter/material.dart';
import 'package:gokyo/resource/theme/colors.dart';

class ExpandableDescription extends StatefulWidget {
  final String description;

  ExpandableDescription({required this.description});

  @override
  _ExpandableDescriptionState createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: textTheme.bodyLarge,
        ),
        Text(
          widget.description,
          maxLines: isExpanded ? null : 2,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'View less' : 'View more',
            style: const TextStyle(color: textColor),
          ),
        ),
      ],
    );
  }
}
