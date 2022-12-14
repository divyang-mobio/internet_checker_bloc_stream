part of 'internet_checker_bloc.dart';

abstract class InternetCheckerEvent {}

class IsInternetAvailable extends InternetCheckerEvent {
  bool isAvailable;

  IsInternetAvailable({required this.isAvailable});
}
