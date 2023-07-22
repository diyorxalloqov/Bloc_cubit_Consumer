// ignore_for_file: must_be_immutable

import 'package:bloc_consumer_app/model/CommentsModel.dart';
import 'package:bloc_consumer_app/service/CommentsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Comments_cubit.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentsInitialState extends CommentsState {
  const CommentsInitialState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentsLoadingState extends CommentsState {
  const CommentsLoadingState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentsErrorState extends CommentsState {
  String error;
  CommentsErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class CommentsCompleteState extends CommentsState {
  List<CommentsModel> model;

  CommentsCompleteState(this.model);

  @override
  // TODO: implement props
  List<Object?> get props => [model];
}

class CommentsReciveMessage extends CommentsState {
  final List<CommentsModel> model;
  const CommentsReciveMessage(this.model);

  @override
  // TODO: implement props
  List<Object?> get props => [model];
}
