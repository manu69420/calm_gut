import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/chat/bloc/chat_bloc.dart';
import 'package:calm_gut/chat/deletion/cubit/deletion_cubit.dart';
import 'package:calm_gut/chat/deletion/delete_dialog.dart';
import 'package:calm_gut/chat/view/chat_builder.dart';
import 'package:calm_gut/core/widgets/error_card.dart';
import 'package:calm_gut/core/widgets/shimmer.dart';
import 'package:calm_gut/repository/chat_repository/src/chat_repository.dart';
import 'package:calm_gut/repository/message_repository/src/message_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatId = context.read<AuthenticationRepository>().currentUser.id;
    return BlocProvider(
      lazy: false,
      create:
          (context) => ChatBloc(
            messageRepository: MessageRepository(chatId: chatId),
            chatRepository: ChatRepository(),
          )..add(MessagesFetched()),
      child: SingleUserChatView(
        chatId: chatId,
        chatName: AppLocalizations.of(context)!.chatbot,
      ),
    );
  }
}

class SingleUserChatView extends StatefulWidget {
  const SingleUserChatView({
    super.key,
    required this.chatId,
    required this.chatName,
  });

  final String chatId;
  final String chatName;

  @override
  State<SingleUserChatView> createState() => _SingleUserChatViewState();
}

class _SingleUserChatViewState extends State<SingleUserChatView> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  late final ChatBloc chatBloc;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    chatBloc = context.read<ChatBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.chatName,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<void>(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  final chatId =
                      context.read<AuthenticationRepository>().currentUser.id;
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: chatBloc),
                      BlocProvider<DeletionCubit>(
                        create:
                            (context) => DeletionCubit(
                              messageRepository: MessageRepository(
                                chatId: chatId,
                              ),
                              chatBloc: chatBloc,
                            ),
                      ),
                    ],
                    child: DeleteDialog(),
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: Column(
          children: [
            Expanded(
              child: _MessagesBuilder(scrollController: _scrollController),
            ),
            _buildSendContainer(context),
          ],
        ),
      ),
    );
  }

  Align _buildSendContainer(BuildContext context) {
    final waitingResponse = context.read<ChatBloc>().state.waitingResponse;
    final canSend = !waitingResponse && _messageController.text.isNotEmpty;
    return Align(
      alignment: Alignment(0, 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 20),
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.sendMessage,
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                controller: _messageController,
                onSubmitted: (value) => _sendMessage,
                enabled: !waitingResponse,
                onChanged: (value) => setState(() {}),
              ),
            ),
            IconButton(
              onPressed: canSend ? _sendMessage : null,
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isEmpty) return;
    context.read<ChatBloc>().add(
      MessageSent(
        text: _messageController.text,
        authorId: context.read<AuthenticationRepository>().currentUser.id,
      ),
    );
    _messageController.clear();
  }

  void _onScroll() {
    if (_isTop) {
      context.read<ChatBloc>().add(MessagesFetched());
    }
  }

  bool get _isTop {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.minScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}

class _MessagesBuilder extends StatelessWidget {
  const _MessagesBuilder({required ScrollController scrollController})
    : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        switch (state.status) {
          case ChatStatus.initial:
          case ChatStatus.loading:
            return Center(child: CircularProgressIndicator());
          case ChatStatus.failure:
            return ErrorCard();
          case ChatStatus.empty:
            return _EmptyMessagesView();
          case ChatStatus.success:
            final messages = state.messages;
            if (messages != null && messages.isEmpty) {
              return _EmptyMessagesView();
            }
            return ChatBuilder(
              messages: messages!,
              currentUserId:
                  context.read<AuthenticationRepository>().currentUser.id,
              scrollController: _scrollController,
              waitingResponse: state.waitingResponse,
            );
        }
      },
    );
  }
}

class _EmptyMessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment(0, 0),
          child: Text(
            AppLocalizations.of(context)!.emptyChatMessage,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
