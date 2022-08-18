import 'package:app/data/providers/roadmap_provider.dart';
import 'package:app/domain/models/response_model.dart';
import 'package:app/domain/repositories/base_reposotory.dart';

class RoadmapRepository extends BaseRepository {
  final RoadmapProvider _roadmapProvider = RoadmapProvider();

  Future<ResponseModel> getPages() async {
    var pages = await getData(_roadmapProvider.getPages);
    return pages;
  }

  Future<ResponseModel> getPage(int id) async {
    var page = await getData(_roadmapProvider.getPage, id);
    return page;
  }
}
