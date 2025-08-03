import '../api/api_request_result.dart';

/// A generic abstract class that defines the contract for use cases.
///
/// Use cases encapsulate specific operations that can be executed
/// in the application, allowing for separation of business logic
/// from other layers. Each use case must implement this class
/// to ensure consistent behavior across different operations.
///
/// [Type] - The type of the result that the use case returns.
/// [Params] - The type of parameters that the use case accepts.
abstract class ApiUseCase<Type, Params> {
  /// An abstract method that each use case must implement.
  ///
  /// Naming it [call] allows the class to be invoked as a function,
  /// which is a feature of callable classes in Dart.
  ///
  /// Executes the use case with the provided parameters.
  ///
  /// Returns a [Future] that completes with an [ApiRequestResult] value,
  /// which can either be a [ApiErrorModel] on the left side or the
  /// expected result of type [Type] on the right side.
  Future<ApiRequestResult<Type>> call(Params params);
}
