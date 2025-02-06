import 'package:flutter/material.dart';
import 'package:flutter_demo_mock_app/models/pokedex/pokedex_page_state.dart';
import 'package:flutter_demo_mock_app/states/pokedex/usecase/loaded_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadedContents extends ConsumerWidget {
  const LoadedContents({
    super.key,
    required this.state,
    required this.notifier,
  });

  final PokedexLoaded state;
  final LoadedCase notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: state.pokemons
          .map(
            (poke) => Column(
              children: [
                ListTile(
                  leading: Image.network(
                    poke.sprites.backDefault ?? "",
                  ),
                  title: Text(
                    poke.name,
                  ),
                  onTap: () {},
                ),
                const Divider(),
              ],
            ),
          )
          .toList(),
    );
  }
}
