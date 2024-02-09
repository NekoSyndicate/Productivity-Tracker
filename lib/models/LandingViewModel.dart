import 'package:productivity_tracker/data_layer/DataConnector.dart';
import './LoginViewModel.dart';
Future<bool>  isAuthed() async {
  DataConnector data = await DataConnector.create();
  bool isAuthed = await loginAction(
      await data.getAccessCode(),
      await data.getTMNumber(),
      await data.getStoreNumber()
  );
  return isAuthed;
}