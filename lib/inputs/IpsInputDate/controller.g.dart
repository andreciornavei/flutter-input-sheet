// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IpsInputDateController on _IpsInputDateController, Store {
  final _$currentDateAtom = Atom(name: '_IpsInputDateController.currentDate');

  @override
  DateTime get currentDate {
    _$currentDateAtom.context.enforceReadPolicy(_$currentDateAtom);
    _$currentDateAtom.reportObserved();
    return super.currentDate;
  }

  @override
  set currentDate(DateTime value) {
    _$currentDateAtom.context.conditionallyRunInAction(() {
      super.currentDate = value;
      _$currentDateAtom.reportChanged();
    }, _$currentDateAtom, name: '${_$currentDateAtom.name}_set');
  }

  final _$_IpsInputDateControllerActionController =
      ActionController(name: '_IpsInputDateController');

  @override
  dynamic setCurrentDate(DateTime newValue, List<int> ints) {
    final _$actionInfo =
        _$_IpsInputDateControllerActionController.startAction();
    try {
      return super.setCurrentDate(newValue, ints);
    } finally {
      _$_IpsInputDateControllerActionController.endAction(_$actionInfo);
    }
  }
}
