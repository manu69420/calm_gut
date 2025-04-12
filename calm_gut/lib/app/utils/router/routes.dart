abstract final class Routes {
  static const login = '/login';
  static const signUp = '/sign-up';
  static const diary = '/';
  static final ChatRoutes chatRoutes = ChatRoutes();
  static final ProfileRoutes profileRoutes = ProfileRoutes();
}

final class ChatRoutes {
  String get allChats => '/chats';
  String singleUserChat({required String chatId}) => '/chats/$chatId';
}

final class ProfileRoutes {
  String get profile => '/profile';
  String get createRecord => '/profile/create-medical-record';
}
