import '../../../models/SourceResponse.dart';

abstract class SourceStates {}

class SourceLoadingState extends SourceStates {}

class SourceErrorState extends SourceStates {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceStates {
  List<Source> sourceList;

  SourceSuccessState({required this.sourceList});
}
