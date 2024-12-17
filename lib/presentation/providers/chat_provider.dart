import 'package:flutter/material.dart';
import 'package:flutter_main/config/helpers/get_yes_no_answers.dart';
import 'package:flutter_main/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswers();

  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Bien", fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final element = Message(text: text, fromWho: FromWho.me);

    messageList.add(element);

    if (text.endsWith("?")) {
      herReply();
    }

    notifyListeners();

    moveScrolToBottom();
  }

  Future<void> moveScrolToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);

    notifyListeners();

    moveScrolToBottom();
  }
}
