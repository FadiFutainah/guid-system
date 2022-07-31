import 'package:app/domain/entities/response_model.dart';

class ProfileRepository {
  Future<ResponseModel> requestData(Function request) async {
    try {
      return ResponseModel(await request(), false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }
}
