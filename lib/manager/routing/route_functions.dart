import 'package:flutter/material.dart';

void goToPage({required BuildContext context,required String routePage, Object? arguments}) =>
    Navigator.pushNamed(context, routePage, arguments: arguments);

void replaceWithPage(
        BuildContext context, String routePage, Object? arguments) =>
    Navigator.pushReplacementNamed(context, routePage, arguments: arguments);

//! The way you take data from another page by arguments
// final data = ModalRoute.of(context)?.settings.arguments as DataType;

void backToPreviousPage(BuildContext context) => Navigator.pop(context);
