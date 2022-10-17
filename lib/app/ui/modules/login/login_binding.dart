import 'package:get/get.dart';
import '../../../data/providers/firebase_provider.dart';
import '../../../data/providers/i_firebase_provider.dart';
import '../../../data/repositories/firebase_repository.dart';
import '../../../data/repositories/i_firebase_repository.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    //Provider
    Get.lazyPut<IFirebaseProvider>(() => FirebaseProvider());
    //Repository
    Get.lazyPut<IFirebaseRepository>(
        () => FirebaseRepository(firebaseProvider: Get.find()));
    //Controller
    Get.put(LoginController(firebaseRepository: Get.find()));
  }
}
