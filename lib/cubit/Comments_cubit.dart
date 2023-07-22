part of 'Comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(const CommentsInitialState()) {
    getDatas();
  }

  List<CommentsModel> data = [];
  bool message = false;

  Future<void> reciveMessage() async {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => emit(CommentsReciveMessage(data)));
    message = true;
    print("hello");

    print(data.length);
  }

  CommentsService service = CommentsService();
  // logic

  Future<void> getDatas() async {
    emit(const CommentsLoadingState());
    dynamic response = await service.getComments();
    if (response is List<CommentsModel>) {
      data = response;
      emit(CommentsCompleteState(response));
      reciveMessage();
    } else {
      emit(CommentsErrorState(response));
    }
  }
}
