import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamiy_app/UI/radio/model/Radios.dart';
import 'package:islamiy_app/api/api_manger.dart';

part 'radio_view_model_state.dart';

class RadioViewModelCubit extends Cubit<RadioViewModelState> {
  RadioViewModelCubit() : super(RadioViewModelInitial());
  getRadio({required String language}) async {
    var response = await ApiManger.getRadioResponse(language: language);
    return response.fold((result) {
      List<Radios> radioList = result.radios ?? [];
      emit(RadioViewModelSuccessState(radioList));
    }, (error) {
      emit(RadioViewModelErrorState(error));
    });
  }
}
