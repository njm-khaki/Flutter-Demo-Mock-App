import 'package:flutter/material.dart';
import 'package:flutter_demo_mock_app/models/pokedex/pokedex_page_state.dart';
import 'package:flutter_demo_mock_app/response_data/pokemon_detail/pokemon_detail.dart';
import 'package:flutter_demo_mock_app/states/pokedex/usecase/pokedex_additional_error_case.dart';
import 'package:flutter_demo_mock_app/states/pokedex/usecase/pokedex_loaded_case.dart';
import 'package:flutter_demo_mock_app/states/pokedex/usecase/pokedex_obtained_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nil/nil.dart';

/// ポケモン図鑑 読み込み済状態 UI
class PokedexLoadedContents extends ConsumerWidget {
  const PokedexLoadedContents({
    super.key,
    required this.state,
    required this.notifier,
  });

  // 読み込み済状態情報
  final PokedexObtained state;
  // 読み込み済状態 ユーザーイベント
  final PokedexObtainedCase notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NotificationListener<ScrollEndNotification>(
      child: ListView(
        children: [
          ...state.pokemons.map(
            (PokemonDetail poke) => Column(
              children: [
                ListTile(
                  leading: Image.network(
                    poke.sprites.frontDefault ??
                        "https://pokeboon.com/jp/wp-content/uploads/2019/05/no-image_pokemon.png",
                  ),
                  title: Text(
                    poke.name,
                  ),
                  onTap: () => notifier.onTapPokemon(
                    context,
                    poke,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          // 追加読み込み状況
          switch (state) {
            PokedexAdditionalLoading() => Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            PokedexAdditionalError() => ElevatedButton(
                onPressed: () {
                  (notifier as PokedexAdditionalErrorCase)
                      .onTapAddtionalRetryButton();
                },
                child: Text('Retry'),
              ),
            PokedexLoaded() => nil,
          }
        ],
      ),
      onNotification: (notification) {
        if (state is PokedexLoaded) {
          (notifier as PokedexLoadedCase).onPokemonListScrollEnd(
            notification,
          );
        }
        return false;
      },
    );
  }
}
