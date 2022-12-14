part of 'internet_checker_bloc.dart';

abstract class InternetCheckerState {}

class InternetCheckerInitial extends InternetCheckerState {}

class InternetConnected extends InternetCheckerState {}

class InternetNotConnected extends InternetCheckerState {}
