
part of 'theme_mode_bloc.dart';

class ThemeModeState extends Equatable {

  final bool switchValue;

  const ThemeModeState({
    required this.switchValue,
  });

  @override
  List<Object?> get props => [switchValue];


 factory ThemeModeState.fromJson(Map<String, dynamic> json) =>
      ThemeModeState(switchValue: json['switchValue']??false );


  Map<String, dynamic> toJson(ThemeModeState state) =>
  
      <String, dynamic>{'switchValue': switchValue}; 
}
