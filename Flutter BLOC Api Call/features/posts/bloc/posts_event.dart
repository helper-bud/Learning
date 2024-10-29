part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

// REGISTERING THE COMMON EVENT THAT MIGHT TAKE PLACE.
class PostsInitialFetchEvent extends PostsEvent {}

class PostsAddEvent extends PostsEvent {}
