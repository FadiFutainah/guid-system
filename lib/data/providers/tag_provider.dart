import 'package:app/application/utils/config/config.dart';
import 'package:app/data/entities/out_tag_dto.dart';
import 'package:app/data/helpers/restapi_service.dart';

class TagProvider {
  final RestApiService _restApi =
      // ignore: prefer_interpolation_to_compose_strings
      RestApiService(domain + 'api/tag/');

  Future<List<OutTagDto>> getTags() async {
    try {
      var response = await _restApi.get('tags');
      return List.from(response.map((e) => OutTagDto.fromMap(e)));
    } catch (e) {
      rethrow;
    }
  }
}
