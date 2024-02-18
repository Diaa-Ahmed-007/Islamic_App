import 'package:flutter/material.dart';

class HadethTitleWidget extends StatelessWidget {
  const HadethTitleWidget({
    super.key,
    required this.hadethTitle,
    required this.ontap,
  });

  final String hadethTitle;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            hadethTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
