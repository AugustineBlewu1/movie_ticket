import 'package:flutter/material.dart';

//navigation for the application

extension Navigation on BuildContext {
  pushReplacement({required String? screen, Object? arguments}) {
    return Navigator.pushReplacementNamed(this, screen!, arguments: arguments);
  }

  push({required String? screen, Object? arguments}) {
    return Navigator.pushNamed(this, screen!, arguments: arguments);
  }

  pop() {
    return Navigator.of(this).pop();
  }

  pushRoot({String? screen, Object? arguments}) {
    return Navigator.of(this, rootNavigator: true).pushNamedAndRemoveUntil(
        screen!, ModalRoute.withName('/'),
        arguments: arguments);
  }

  pushRootwithContext({Widget? screen, Object? arguments}) {
    return Navigator.of(this, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (builder) => screen!),
        ModalRoute.withName('/'));
  }

  pushwithContext(Widget? screen) {
    return Navigator.push(
        this, MaterialPageRoute(builder: (builder) => screen!));
  }

  mayBePOP() {
    return Navigator.maybePop(
        this,);
  }
}
