import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../data/models/pokemon.dart';
import '../../../../data/models/types_pokemon.dart';
import '../../../../routes/app_pages.dart';
import '../../../themes/app_images.dart';

class PokemonCard extends GetView {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.pokemonDetails, arguments: pokemon),
      child: Container(
        height: 40,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: TypesPokemon.backColor(pokemon.primaryType!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: -20.0,
              right: -40.0,
              child: Image.asset(
                AppImages.pokeball,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 90,
                      width: 90,
                      child: SvgPicture.network("${pokemon.image}"),
                    ),
                    Text(
                      "# ${pokemon.position}",
                      style: TextStyle(
                        color: TypesPokemon.textColor(pokemon.primaryType!),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.name!.toUpperCase(),
                        style: TextStyle(
                          color: TypesPokemon.textColor(pokemon.primaryType!),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        pokemon.primaryType!.tr.toUpperCase(),
                        style: TextStyle(
                          color: TypesPokemon.textColor(pokemon.primaryType!),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
