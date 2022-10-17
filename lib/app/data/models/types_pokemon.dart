import 'dart:ui';

final Map<String,String> typesPokemonStringsPtBR = {
  "bug" : "inseto",
  "dark" : "sombrio",
  "dragon" : "dragão",
  "electric" : "elétrico",
  "fairy" : "fada",
  "fighting" : "lutador",
  "fire" : "fogo",
  "flying" : "voador",
  "ghost" : "fantasma",
  "grass" : "grama",
  "ground" : "terra",
  "ice" : "gelo",
  "normal" : "normal",
  "poison" : "veneno",
  "psychic" : "psíquico",
  "rock" : "pedra",
  "steel" : "ferro",
  "water" : "água",
};

final Map<String,String> typesPokemonStringsEnUS = {
  "bug" : "bug",
  "dark" : "dark",
  "dragon" : "dragon",
  "electric" : "electric",
  "fairy" : "fairy",
  "fighting" : "fighting",
  "fire" : "fire",
  "flying" : "flying",
  "ghost" : "ghost",
  "grass" : "grass",
  "ground" : "ground",
  "ice" : "ice",
  "normal" : "normal",
  "poison" : "poison",
  "psychic" : "psychic",
  "rock" : "rock",
  "steel" : "steel",
  "water" : "water",
};

class TypesPokemon {
  static Color backColor(String type) {
    if (type == 'bug') return const Color(0xFF3c9950);
    if (type == 'dark') return const Color(0xFF595978);
    if (type == 'dragon') return const Color(0xFF62cad9);
    if (type == 'electric') return const Color(0xfff6f65e);
    if (type == 'fairy') return const Color(0xFFe91368);
    if (type == 'fighting') return const Color(0xFFef6239);
    if (type == 'fire') return const Color(0xFFfd4b5a);
    if (type == 'flying') return const Color(0xFF94b2c7);
    if (type == 'ghost') return const Color(0xFF906791);
    if (type == 'grass') return const Color(0xFF27cb50);
    if (type == 'ground') return const Color(0xFF6e491f);
    if (type == 'ice') return const Color(0xff46baea);
    if (type == 'normal') return const Color(0xFFca98a6);
    if (type == 'poison') return const Color(0xFF9b69da);
    if (type == 'psychic') return const Color(0xFFf71d92);
    if (type == 'rock') return const Color(0xFF8b3e22);
    if (type == 'steel') return const Color(0xFF42be94);
    if (type == 'water') return const Color(0xFF85a8fb);
    return const Color(0xFFe6e6e6);
  }

  static Color textColor(String type) {
    if (type == 'bug') return const Color(0xFF1c4b27);
    if (type == 'dark') return const Color(0xFF040707);
    if (type == 'dragon') return const Color(0xFF448a95);
    if (type == 'electric') return const Color(0xffdb9a0d);
    if (type == 'fairy') return const Color(0xFF961a45);
    if (type == 'fighting') return const Color(0xFF994025);
    if (type == 'fire') return const Color(0xFFab1f24);
    if (type == 'flying') return const Color(0xFF4a677d);
    if (type == 'ghost') return const Color(0xFF33336b);
    if (type == 'grass') return const Color(0xFF147b3d);
    if (type == 'ground') return const Color(0xFFa8702d);
    if (type == 'ice') return const Color(0xff2586ac);
    if (type == 'normal') return const Color(0xFF75525c);
    if (type == 'poison') return const Color(0xFF5e2d89);
    if (type == 'psychic') return const Color(0xFFa52a6c);
    if (type == 'rock') return const Color(0xFF48190b);
    if (type == 'steel') return const Color(0xFF60756e);
    if (type == 'water') return const Color(0xFF1552e1);
    return const Color(0xFFe6e6e6);
  }
}
