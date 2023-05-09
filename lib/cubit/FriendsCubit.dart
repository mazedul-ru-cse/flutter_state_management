import 'package:bloc/bloc.dart';

part 'InitialFriendsState.dart';

class Friends {
  static List<String> friendsName =
  [
    "Mazedul",
    "Rony",
    "Minhajul",
    "Moon"
  ];
}

class FriendsCubit extends Cubit<InitialFriends> {
  FriendsCubit() : super(InitialFriends(friendsName: Friends.friendsName));

  void addANewFriend(String newFriendName){
    final friendsList = state.friendsName;
    friendsList.add(newFriendName);
    emit(InitialFriends(friendsName: friendsList));
  }

  void removeAFriend(int index){
    final friendsList = state.friendsName;
    friendsList.removeAt(index);
    emit(InitialFriends(friendsName: friendsList));
  }
}
