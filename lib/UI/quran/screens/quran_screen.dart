import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/providers/quran_provider.dart';
import 'package:islamiy_app/UI/quran/models/quran_details_model.dart';
import 'package:islamiy_app/UI/quran/widgets/quran_item.dart';
import 'package:provider/provider.dart';

class QuranWidget extends StatelessWidget {
  const QuranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuranProvider provider = Provider.of<QuranProvider>(context);
    return Column(
      children: [
        Image.asset('assets/images/jame3.png'),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 4,
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "اسم السوره",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 4,
              height: 45,
              color: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
                child: Text(
              " عدد الايات",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            )),
          ],
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 4,
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                QuranItem(
                  index: index,
                  suraName: QuranDetailsModel.suraNames[index],
                  suraNumber: QuranDetailsModel.versesNumber[index].toString(),
                ),
              ],
            ),
            itemCount: QuranDetailsModel.suraNames.length,
          ),
        ),
        provider.isQuranPlaybarVisable
            ? const SizedBox(
                height: 150,
              )
            : const SizedBox(
                height: 0,
              ),
      ],
    );
  }
}