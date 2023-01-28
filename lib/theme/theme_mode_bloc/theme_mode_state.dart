
part of 'theme_mode_bloc.dart';

class ThemeModeState extends Equatable {

  final ThemeData themeData;

  const ThemeModeState({
    required this.themeData,
  });

  @override
  List<Object?> get props => [themeData];


/*  factory ThemeModeState.fromJson(Map<String, dynamic> json) =>
      ThemeModeState(themeData: json['themeData'] as ThemeData);


  Map<String, dynamic> toJson(ThemeModeState state) =>
  
      <String, dynamic>{'themeData': this.themeData}; */
}
