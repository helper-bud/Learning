#### Flow
The whole flow of the work goes like this. 
1. First Create the Post Bloc.
2. posts_bloc.dart, post_event.dart, posts_state.dart
3. post_event.dart -> holds the common event like Inital fetching the posts, or Adding the posts in event.
4. while dealing with this event different state might come up. This different state is mentioned in the __posts_state.dart___. 
5. The states are emitted in the __posts_bloc.dart__ this file will use the __ post_repo.dart __ to make the api call and based on that emit events. 
#### UI
1. __ post_page.dart__ this is the ui file. 
2. The ui file will first call the bloc and add the event in the bloc. 
3. In the initState you can see the added event. 
4. After that using BlocConsumer (mentioning the PostBloc and PostState). based on the different event it will execute something. 
5. When ever you want a new event you need to add that event in the bloc. 
6. Based on state it will handle the different scenario. 
8. But the state will be the one hold and transfer the data. 

<\br>
in this case the Main.dart is not used. The bloc was directly registered in the post_page.dart. 
