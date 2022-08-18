import 'package:app/application/utils/config/config.dart';
import 'package:app/data/entities/page_dto.dart';
import 'package:app/data/helpers/restapi_service.dart';

class RoadmapProvider {
  final RestApiService _restApi =
      // ignore: prefer_interpolation_to_compose_strings
      RestApiService(domain + 'api/roadmap/');

  Future<List<PageDto>> getPages() async {
    try {
      var response = await _restApi.get('pages/');
      return List.from(response.map((e) => PageDto.fromMap(e)));
    } catch (e) {
      rethrow;
    }
  }

  Future<PageDto> getPage(int id) async {
    try {
      var response = await _restApi.get('pages/$id/');
      return PageDto.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}
