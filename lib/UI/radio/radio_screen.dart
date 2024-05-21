import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiy_app/UI/providers/radio_provider.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/radio/model/Radios.dart';
import 'package:islamiy_app/UI/radio/view_model/cubit/radio_view_model_cubit.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RadioWidget extends StatelessWidget {
  RadioWidget({super.key});
  late List<Radios> radioList;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    RadioProvider radioProvider = Provider.of<RadioProvider>(context);
    return BlocProvider(
        create: (context) => RadioViewModelCubit()
          ..getRadio(language: provider.getLanguage() == 'en' ? "eng" : "ar"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 130,
            ),
            Image.asset("assets/images/radio.png"),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<RadioViewModelCubit, RadioViewModelState>(
              builder: (context, state) {
                if (state is RadioViewModelSuccessState) {
                  radioList = state.radioList;
                  return Text(radioList[radioProvider.radioIndex].name ?? "",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium);
                }
                if (state is RadioViewModelErrorState) {
                  return Text(
                    state.errorMassage,
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                }
                return Text(
                  "",
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                provider.getLanguage() == 'en'
                    ? leftDirection(context, onTap: () {
                        lastPage(context: context);
                      })
                    : rightDirection(context, onTap: () {
                        nextPage(context: context);
                      }),
                radioProvider.playAudio
                    ? InkWell(
                        onTap: () async {
                          await player.pause();
                          radioProvider.changePlayAudioValue(false);
                        },
                        child: Icon(
                          Icons.pause,
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          await player.play(UrlSource(
                              radioList[radioProvider.radioIndex].url ?? ""));
                          radioProvider.changePlayAudioValue(true);
                        },
                        child: SvgPicture.asset(
                            "assets/images/Icon awesome-play.svg",
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn)),
                      ),
                provider.getLanguage() == 'en'
                    ? rightDirection(context, onTap: () {
                        nextPage(context: context);
                      })
                    : leftDirection(context, onTap: () {
                        lastPage(context: context);
                      })
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }

  Widget rightDirection(BuildContext context, {required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset("assets/images/Icon metro-next (1).svg",
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary, BlendMode.srcIn)),
    );
  }

  Widget leftDirection(BuildContext context, {required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        "assets/images/Icon metro-next.svg",
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary, BlendMode.srcIn),
      ),
    );
  }

  nextPage({required BuildContext context}) async {
    RadioProvider provider = Provider.of<RadioProvider>(context, listen: false);
    if (provider.radioIndex + 1 > radioList.length - 1) {
     await player.stop();
      provider.changePlayAudioValue(false);
      provider.lastPage();
    } else {
      await player.stop();
      provider.changePlayAudioValue(false);
      provider.incressRadioIndex();
    }
  }

  lastPage({required BuildContext context}) async {
    RadioProvider provider = Provider.of<RadioProvider>(context, listen: false);
    if (provider.radioIndex == 0) {
      await player.stop();
      provider.changePlayAudioValue(false);
      provider.backPage(radioList.length - 1);
    } else {
      await player.stop();
      provider.changePlayAudioValue(false);
      provider.decresRadioIndex();
    }
  }
}
