import 'package:app/domain/models/response_model.dart';

Future<ResponseModel> requestData(Function request) async {
  try {
    return ResponseModel(await request(), false);
  } catch (e) {
    return ResponseModel(e.toString(), true);
  }
}
