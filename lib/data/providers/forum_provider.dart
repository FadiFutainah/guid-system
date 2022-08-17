import 'package:app/data/entities/forum_dto.dart';
import 'package:app/data/entities/reply_dto.dart';
import 'package:app/data/helpers/restapi_service.dart';

enum Ordering {
  pointAsc,
  pointDesc,
  timeAsc,
  timeDesc,
  none,
}

Map<Ordering, String> orderingString = {
  Ordering.pointAsc: 'points',
  Ordering.pointDesc: '-points',
  Ordering.timeAsc: 'time',
  Ordering.timeDesc: '-time',
  Ordering.none: '',
};

class ForumProvider {
  final RestApiService _restApi =
      RestApiService('https://guide-system-backend.herokuapp.com/api/forum/');

  Future<List<ForumDto>> getForums({
    required int page,
    required String search,
    required Ordering ordering,
    bool? isQuestion,
    bool? isClosed,
    bool? isMine,
    int? tagID,
  }) async {
    String res = '?';
    res += 'page=$page';
    res += '&search=$search';
    res += '&ordering=${orderingString[ordering]}';
    if (isQuestion != null) {
      res += '&is_question=$isQuestion';
    }
    if (isClosed != null) {
      res += '&is_closed=$isClosed';
    }
    if (isMine != null) {
      res += '&is_mine=$isMine';
    }
    if (tagID != null) {
      res += '&tag=$tagID';
    }
    try {
      var response = await _restApi.get('forums/$res');
      return List<ForumDto>.from(
          response['results'].map((e) => ForumDto.fromMap(e)));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ReplyDto>> getReplies(int id) async {
    try {
      var response = await _restApi.get('forums/$id/replies/');
      return List<ReplyDto>.from(
        response['results'].map(
          (e) => ReplyDto.fromMap(e),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addForum(Map<String, dynamic> body) async {
    try {
      await _restApi.post('forums/forum', body, hasToken: true);
    } catch (e) {
      rethrow;
    }
  }
}
