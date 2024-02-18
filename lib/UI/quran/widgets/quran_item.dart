import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/quran/models/quran_details_model.dart';
import 'package:islamiy_app/UI/quran/screens/quran_details_screen.dart';

class QuranItem extends StatelessWidget {
  final String suraName;
  final String suraNumber;
  final int index;
  const QuranItem(
      {super.key,
      required this.suraName,
      required this.suraNumber,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QuranDetailsScreen.routeName,
            arguments: QuranDetailsModel(title: suraName, index: index));
      },
      child: Row(
        children: [
          Expanded(
            child: Text(suraNumber,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          Container(
            width: 4,
            height: 45,
            color: Theme.of(context).colorScheme.primary,
          ),
          Expanded(
              child: Text(
            suraName,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
