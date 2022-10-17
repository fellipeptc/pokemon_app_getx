import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/pokemon.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';

class GraphPokemon extends StatelessWidget {
  final List<Pokemon> pokemonEvolutions;
  final Color backColor;

  const GraphPokemon({
    Key? key,
    required this.pokemonEvolutions,
    required this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 240,
      child: LineChart(
        LineChartData(
          maxX: pokemonEvolutions.length - 1.0,
          maxY: pokemonEvolutions[pokemonEvolutions.length - 1]
              .baseExperience
              ?.toDouble(),
          minX: 0,
          minY: 0,
          borderData: FlBorderData(
            show: true,
            border: Border(
              top: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide(width: 1, color: backColor),
              left: BorderSide(width: 1, color: backColor),
            ),
          ),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(
              axisNameSize: 30,
              axisNameWidget: Text(
                "LEVEL_XP".tr.toUpperCase(),
                style: AppTextStyles.textBoldWhite16,
              ),
            ),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    pokemonEvolutions[value.toInt()].name!,
                    style: AppTextStyles.textNormalWhite14,
                  ),
                );
              },
            )),
          ),
          lineBarsData: [
            LineChartBarData(
                spots: pokemonEvolutions.map((pokemon) {
                  double i = pokemonEvolutions.lastIndexOf(pokemon).toDouble();
                  return FlSpot(i, pokemon.baseExperience!.toDouble());
                }).toList(),
                isCurved: true,
                color: AppColors.white,
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  color: backColor,
                )),
          ],
        ),
      ),
    );
  }
}
