import 'package:app/application/utils/config/config.dart';
import 'package:app/data/entities/forum_dto.dart';
import 'package:app/data/entities/reply_dto.dart';
import 'package:app/data/helpers/restapi_service.dart';

class ForumProvider {
  final RestApiService _restApi =
      // ignore: prefer_interpolation_to_compose_strings
      RestApiService(domain + 'api/forum/');

  Future<List<ForumDto>> getForums() async {
    try {
      var response = await _restApi.get('forums/');
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
