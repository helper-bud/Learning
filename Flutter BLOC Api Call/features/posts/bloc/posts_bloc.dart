import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_call/features/posts/model/postModel.dart';
import 'package:bloc_api_call/features/posts/repo/post_repo.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(
        postsInitialFetchEvent); // REGISTERING THE EVENT.
    on<PostsAddEvent>(postsAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    // CALLING THE EVENT.
    emit(
        PostFetchingLoadingState()); // EMITTING THE LOADING STATE AT THE BEGINING
    try {
      List<PostDataUiModel> posts = await PostRepo
          .fetchPostData(); // REPOSITORY WILL HANDLE THE API CALL.
      emit(PostFetchingSuccessfulState(posts: posts));
    } catch (e) {
      emit(PostFetchingErrorState()); // IF ERROR OCCURS SAME SITUATION.
      log(e.toString());
    }
  }

  FutureOr<void> postsAddEvent(
      PostsAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostRepo.addPostData();
    if (success) {
      emit(PostAddSuccesstate());
    } else {
      emit(PostAddErrortate());
    }
  }
}
