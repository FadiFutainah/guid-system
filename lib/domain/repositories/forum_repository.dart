import 'package:app/data/providers/forum_provider.dart';
import 'package:app/domain/models/response_model.dart';
import 'package:app/domain/repositories/base_reposotory.dart';

class ForumRepository extends BaseRepository {
  final ForumProvider _forumProvider = ForumProvider();

  Future<ResponseModel> getForums({
    required int page,
    required String search,
    required Ordering ordering,
    bool? isQuestion,
    bool? isClosed,
    bool? isMine,
    int? tagID,
  }) async {
    try {
      var response = await _forumProvider.getForums(
        page: page,
        search: search,
        ordering: ordering,
        isQuestion: isQuestion,
        isClosed: isClosed,
        isMine: isMine,
        tagID: tagID,
      );
      return ResponseModel(response, false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }

  Future<ResponseModel> getReplies(id) async {
    var replies = await getData(_forumProvider.getReplies, id);
    return replies;
  }

  Future<ResponseModel> addForum(Map<String, dynamic> body) async {
    try {
      await _forumProvider.addForum(body);
      return ResponseModel('forum published successfully', false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }
}
