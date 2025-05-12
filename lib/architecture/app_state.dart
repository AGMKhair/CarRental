import 'package:flutter/material.dart';

@immutable
class AppState {
  final String? title;

  const AppState({
    this.title,
  });

  factory AppState.initial() => AppState(title: '');

  AppState copyWith({
    String? title,
  }) {
    return AppState(
      title: title ?? this.title,
    );
  }
}
