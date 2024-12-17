import 'package:dio/dio.dart';
import 'package:flutter_main/domain/entities/message.dart';
import 'package:flutter_main/infrastructure/model/yes_no_model.dart';

class GetYesNoAnswers {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    // return Message(
    //     text: yesNoModel.answer,
    //     fromWho: FromWho.hers,
    //     imageUrl: yesNoModel.image);
  }
}
