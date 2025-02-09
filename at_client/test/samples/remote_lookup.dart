import 'dart:io';
import 'package:at_client/src/client/at_client_impl.dart';
import 'test_util.dart';

void main() async {
  try {
    var preference = TestUtil.getPreferenceRemote();
    await AtClientImpl.createClient('@alice', null, preference);
    var atClient = await AtClientImpl.getClient('@alice');
    var result = await atClient
        .getRemoteSecondary()
        .executeCommand('lookup:email@bob\n', auth: true);
    print(result);
  } on Exception catch (e, trace) {
    print(e.toString());
    print(trace);
  }
  exit(1);
}
