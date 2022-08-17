import 'package:app/data/entities/forum_dto.dart';
import 'package:app/data/helpers/restapi_service.dart';

class ProfileProvider {
  final RestApiService _restApi =
      RestApiService('https://guide-system-backend.herokuapp.com/sapi/forum/');

  Future<List<ForumDto>> getForums() async {
    try {
      var response = await _restApi.get('forums/');
      return response.map((e) => ForumDto.fromMap(e));
    } catch (e) {
      rethrow;
    }
  }
}
