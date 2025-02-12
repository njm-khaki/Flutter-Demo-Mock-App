import 'package:flutter_demo_mock_app/response_data/pokemon_detail/pokemon_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sequence_result.freezed.dart';

@freezed
class PokemonSequenceResult with _$PokemonSequenceResult {
  const factory PokemonSequenceResult({
    // ポケモン詳細情報リスト
    @Default([]) List<PokemonDetail> pokemons,
    @Default(null) String? previous,
    @Default(null) String? next,
  }) = _PokemonSequenceResult;
}
