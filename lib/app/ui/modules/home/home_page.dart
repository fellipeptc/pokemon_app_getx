import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app_getx/app/ui/modules/home/widgets/pokemon_card.dart';
import '../../widgets/alert_dialogs/alert_dialog_logout.dart';
import 'home_controller.dart';
import 'widgets/home_drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "POKÉ LIST",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const HomeDrawer(),
        body: Obx(
          () {
            if (controller.listPokemon.isEmpty) {
              return const SizedBox.shrink();
            } else {
              return RefreshIndicator(
                onRefresh: () => controller.refreshPokemonsList(),
                child: GridView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.listPokemon.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (conext, index) {
                    if (index + 1 == controller.listPokemon.length) {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(),
                      ));
                    } else {
                      return PokemonCard(
                          pokemon: controller.listPokemon[index]);
                    }
                  },
                ),
              );
            }
          },
        ),
      ),
      onWillPop: () async {
        await controller.firebaseRepository.logoutAccount();
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialogLogout();
          },
        );
        return false;
      },
    );
  }
}
