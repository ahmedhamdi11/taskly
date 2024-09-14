part of 'create_task_cubit.dart';

sealed class CreateTaskState {}

final class CreateTaskInitial extends CreateTaskState {}

/// upload image states
final class UploadImageLoading extends CreateTaskState {}

final class UploadImageSuccess extends CreateTaskState {
  final String imagePath;

  UploadImageSuccess(this.imagePath);
}

final class UploadImageFailure extends CreateTaskState {
  final String errMessage;

  UploadImageFailure(this.errMessage);
}

/// create task states
final class CreateTaskLoading extends CreateTaskState {}

final class CreateTaskSuccess extends CreateTaskState {}

final class CreateTaskFailure extends CreateTaskState {
  final String errMessage;

  CreateTaskFailure(this.errMessage);
}
