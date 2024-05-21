import 'package:flutter/material.dart';

class SebhaWidget extends StatefulWidget {
  const SebhaWidget({super.key});

  @override
  State<SebhaWidget> createState() => _SebhaWidgetState();
}

class _SebhaWidgetState extends State<SebhaWidget> {
  int sebhaCounter = 0;
  int sebhaListIndex = 0;
  double rotate = 0;
  List<String> tsbeh = [
    'سبحان الله',
    "الحمدلله",
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوه الا بالله'
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: onImageClicked,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 40 ),
                  padding: const EdgeInsets.only(left: 50),
                  child: Image.asset(
                    'assets/images/head of seb7a.png',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Transform.rotate(
                  angle: rotate,
                  child: Container(
                    padding: const EdgeInsets.all(80),
                    child: Image.asset('assets/images/body of seb7a.png',
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondary),
            child: Text(
              '$sebhaCounter',
              style: const TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary),
            child: Text(
              tsbeh[sebhaListIndex],
              style: Theme.of(context).textTheme.displayLarge,
            ),
          )
        ],
      ),
    );
  }

  void onImageClicked() {
    setState(() {
      rotate += 0.190;
      sebhaCounter++;

      if (sebhaCounter == 33) {
        sebhaCounter = 0;
        sebhaListIndex++;
        sebhaListIndex = sebhaListIndex % 5;
      }
    });
  }
}
