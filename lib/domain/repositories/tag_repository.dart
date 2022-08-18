import 'package:app/data/providers/tag_provider.dart';
import 'package:app/domain/models/response_model.dart';
import 'package:app/domain/repositories/base_reposotory.dart';

class TagRepository extends BaseRepository {
  final TagProvider _tagProvider = TagProvider();
  Future<ResponseModel> getTags() async {
    var tags = await getData(_tagProvider.getTags);
    return tags;
  }
}
