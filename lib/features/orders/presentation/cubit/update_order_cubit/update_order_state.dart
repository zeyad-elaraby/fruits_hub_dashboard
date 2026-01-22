sealed class UpdateOrderState {}

final class UpdateOrderInitial extends UpdateOrderState {}

final class UpdateOrderLoading extends UpdateOrderState {}

final class UpdateOrderSuccess extends UpdateOrderState {}

final class UpdateOrderFailure extends UpdateOrderState {
  final String error;
  UpdateOrderFailure(this.error);
}
