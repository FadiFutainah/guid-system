import 'package:app/domain/models/response_model.dart';

class BaseRepository {
  Future<ResponseModel> getData(Function request, [int? id]) async {
    try {
      var response = (id != null) ? await request(id) : await request();
      return ResponseModel(response, false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }
}
