import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiy_app/UI/hadeth/models/hadeth_model.dart';
import 'package:islamiy_app/UI/hadeth/screens/hadeth_body_screen.dart';
import 'package:islamiy_app/UI/hadeth/widgets/hadeth_title.dart';

class AhadethScreen extends StatefulWidget {
  const AhadethScreen({super.key});

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  @override
  Widget build(BuildContext context) {
    if (hadethTitle.isEmpty && hadethBody.isEmpty) {
      getHadeth();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            'assets/images/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png'),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2))),
          child: Text(
            'Ahadeth',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (contaxt, index) {
                return HadethTitleWidget(
                  hadethTitle: hadethTitle[index],
                  ontap: () {
                    Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                        arguments: HadethModel(
                            label: hadethTitle[index],
                            body: hadethBody[index]));
                  },
                );
              },
              separatorBuilder: (contaxt, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  color: Theme.of(context).dividerColor,
                  height: 2,
                );
              },
              itemCount: hadethTitle.length),
        )
      ],
    );
  }

  final List<String> hadethTitle = [];

  final List<String> hadethBody = [];

  void getHadeth() async {
    String hadethDetails =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadeth = hadethDetails.trim().split('#');
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethSplit = ahadeth[i].trim().split('\n');
      hadethTitle.add(hadethSplit[0]);
      hadethSplit.removeAt(0);
      hadethBody.add(hadethSplit.join());
    }
    setState(() {});
  }
}
