part of 'radio_view_model_cubit.dart';

 class RadioViewModelState {}

 class RadioViewModelInitial extends RadioViewModelState {}

 class RadioViewModelSuccessState extends RadioViewModelState{
  List<Radios> radioList;
  RadioViewModelSuccessState(this.radioList);
}

class RadioViewModelErrorState extends RadioViewModelState{
  String errorMassage;
  RadioViewModelErrorState(this.errorMassage);
}
