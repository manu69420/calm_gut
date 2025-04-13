abstract final class Routes {
  static const login = '/login';
  static const signUp = '/sign-up';
  static const diary = '/';
  static const moodPopup = '/mood-popup';
  static final ChatRoutes chatRoutes = ChatRoutes();
  static final ProfileRoutes profileRoutes = ProfileRoutes();
}

final class ChatRoutes {
  String get allChats => '/chats';
  String singleUserChat({required String chatId}) => '/chats/$chatId';
}

final class ProfileRoutes {
  String get profile => '/profile';
  GoPath get createRecord => GoPath(
    fullPath: '/profile/create-medical-record',
    partialPath: '/create-medical-record',
  );
  GoPath get settings =>
      GoPath(fullPath: '/profile/settings', partialPath: '/settings');
}

class GoPath {
  const GoPath({required this.fullPath, required this.partialPath});
  final String fullPath;
  final String partialPath;
}
