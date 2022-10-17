import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon_app_getx/app/ui/modules/pokemon_details/widgets/graph_pokemon.dart';
import 'package:pokemon_app_getx/app/ui/themes/app_animations.dart';
import 'package:pokemon_app_getx/app/ui/themes/app_text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/models/pokemon.dart';
import '../../../data/models/types_pokemon.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import 'pokemon_details_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsController> {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.savePokemon(),
        backgroundColor: AppColors.secondary,
        child: const Icon(
          Icons.cloud,
          color: AppColors.white,
          size: 30,
        ),
      ),
      body: Container(
        color: controller.backColor,
        child: Obx(() {
          if (controller.loading.value ||
              controller.pokemonEvolutions.isEmpty) {
            return Center(
              child: Lottie.asset(
                AppAnimations.pokeballAnimation,
                height: 110,
                width: 110,
              ),
            );
          } else {
            return Stack(
              children: [
                Positioned(
                  top: 120.0,
                  left: 20.0,
                  child: Text(
                    "${controller.pokemon.position}º",
                    style: const TextStyle(
                        fontSize: 88,
                        color: Colors.white54,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Positioned(
                  top: 70.0,
                  right: -100.0,
                  child: Image.asset(
                    AppImages.pokeball,
                    height: 250,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 50, 0, 20),
                                  child: GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                      color: controller.textColor,
                                      size: 34,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CarouselSlider.builder(
                              itemCount: controller.pokemonEvolutions.length,
                              itemBuilder: (contex, index, _) {
                                return _buildPokemonImage(
                                    controller.pokemonEvolutions[index], index);
                              },
                              options: CarouselOptions(
                                height: 210,
                                enlargeCenterPage: true,
                                pageSnapping: true,
                                enableInfiniteScroll: false,
                                initialPage: controller.initialPage.value,
                                onPageChanged: (index, reason) =>
                                    controller.activeIndex.value = index,
                              ),
                            ),
                            Obx(
                              () => AnimatedSmoothIndicator(
                                activeIndex: controller.activeIndex.value,
                                count: controller.pokemonEvolutions.length,
                                effect: WormEffect(
                                  dotHeight: 20,
                                  dotWidth: 20,
                                  activeDotColor: AppColors.white,
                                  dotColor: controller.textColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                width: double.infinity,
                                color: controller.textColor,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        _buildTypeCard(
                                            controller.pokemon.primaryType!),
                                        const SizedBox(width: 20),
                                        controller.pokemon.secondaryType != null
                                            ? _buildTypeCard(controller
                                                .pokemon.secondaryType!)
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          _buildStats(
                                              controller
                                                  .pokemonEvolutions[controller
                                                      .activeIndex.value]
                                                  .stats![1]
                                                  .baseStat!,
                                              AppImages.attack),
                                          _buildStats(
                                              controller
                                                  .pokemonEvolutions[controller
                                                      .activeIndex.value]
                                                  .stats![2]
                                                  .baseStat!,
                                              AppImages.defense),
                                          _buildStats(
                                              controller
                                                  .pokemonEvolutions[controller
                                                      .activeIndex.value]
                                                  .stats![0]
                                                  .baseStat!,
                                              AppImages.hp),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      color: AppColors.white,
                                    ),
                                    const SizedBox(height: 40),
                                    GraphPokemon(
                                      pokemonEvolutions:
                                          controller.pokemonEvolutions.cast(),
                                      backColor: controller.backColor,
                                    ),
                                    const SizedBox(height: 60),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }

  _buildPokemonImage(Pokemon pokemon, int index) {
    return Column(
      children: [
        Text(
          pokemon.name!.toUpperCase(),
          style: AppTextStyles.textBoldWhite22.merge(
            TextStyle(
              color: pokemon.name == controller.pokemon.name
                  ? AppColors.white
                  : controller.textColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 120,
          width: 120,
          color: Colors.transparent,
          child: SvgPicture.network(
            "${pokemon.image}",
          ),
        ),
      ],
    );
  }

  _buildTypeCard(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: TypesPokemon.backColor(type),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        type.tr.toUpperCase(),
        style: AppTextStyles.textBoldWhite14,
      ),
    );
  }

  _buildStats(int baseStat, String image) {
    return Row(
      children: [
        Text(
          "$baseStat",
          style: AppTextStyles.textBoldWhite22,
        ),
        const SizedBox(width: 5),
        Image.asset(
          image,
          width: 30,
          height: 30,
          color: AppColors.white,
        ),
      ],
    );
  }
}
