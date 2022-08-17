import 'package:app/data/providers/forum_provider.dart';
import 'package:app/domain/models/response_model.dart';
import 'package:app/domain/repositories/base_reposotory.dart';

class ForumRepository extends BaseRepository {
  final ForumProvider _forumProvider = ForumProvider();

  Future<ResponseModel> getForums() async {
    var forums = await getData(_forumProvider.getForums);
    return forums;
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
