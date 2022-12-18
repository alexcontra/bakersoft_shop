import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  ///FAILURE MESSAGE
  final String message;

  ///DEFAULT CONSTRUCTOR
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Local failure
class LocalFailure extends Failure {
  /// Default constructor
  const LocalFailure(String message) : super(message);
}
