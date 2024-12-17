import 'package:flutter/material.dart';
import 'package:flutter_main/domain/entities/message.dart';
import 'package:flutter_main/presentation/providers/chat_provider.dart';
import 'package:flutter_main/presentation/widgets/chat/her_message_bubble.dart';
import 'package:flutter_main/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_main/presentation/widgets/shared/field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://w0.peakpx.com/wallpaper/35/333/HD-wallpaper-jon-snow-and-ghost-white-lasahido-art-luminos-game-of-thrones-black-man-fantasy-ghost-lup-wolf-jon-snow-sword.jpg"),
            )),
        title: const Text("Jose"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.me
                          ? MyMessageBubble(message: message)
                          : HerMessageBubble(
                              message: message,
                            ));
                    })),
            FieldBox(onValue: (value) => chatProvider.sendMessage(value))
          ],
        ),
      ),
    );
  }
}
