import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_images.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/alert_dialogs/alert_dialog_logout.dart';
import '../home_controller.dart';

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    AppImages.pokeball,
                    height: 90,
                    width: 90,
                  ),
                ),
                const SizedBox(height: 50.0),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Fellipe Augusto Prates',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'JOB'.tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('fellipeptc@hotmail.com'),
          ),
          const ListTile(
            leading: Icon(Icons.work),
            title: Text('linkedin.com/in/fellipeprates/'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(
              'ABOUT'.tr,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
          ),
          const Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: AppColors.white,
                ),
                title: Text(
                  'LOGOUT'.tr,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                  style: AppTextStyles.textBoldWhite16,
                ),
                onTap: () async {
                  await controller.firebaseRepository.logoutAccount();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialogLogout();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
