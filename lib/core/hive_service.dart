import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initHive() async {
  var dir = await getTemporaryDirectory();
  Hive.init(dir.path);
  await Hive.openBox<String>('recentSearches');
  await Hive.openBox('Settings');
}
