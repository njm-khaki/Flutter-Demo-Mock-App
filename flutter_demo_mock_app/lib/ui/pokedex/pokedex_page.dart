import 'package:flutter/material.dart';
import 'package:flutter_demo_mock_app/models/pokedex/pokedex_page_state.dart';
import 'package:flutter_demo_mock_app/states/pokedex/pokedex_state.dart';
import 'package:flutter_demo_mock_app/ui/pokedex/templates/pokedex_obtained_contents.dart';
import 'package:flutter_demo_mock_app/ui/pokedex/templates/pokedex_loading_contents.dart';
import 'package:flutter_demo_mock_app/ui/pokedex/templates/pokedex_loading_error_contens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ポケモン図鑑画面
class PokedexPage extends ConsumerStatefulWidget {
  const PokedexPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokedexState();
}

/// ポケモン図鑑画面 状態
class _PokedexState extends ConsumerState<PokedexPage> {
  /// 画面表示時の処理
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(pokedexProvider.notifier);
    notifier.onInitState();
  }

  @override
  Widget build(BuildContext context) {
    // ポケモン図鑑画面 状態を取得
    final state = ref.watch(pokedexProvider);
    final notifier = ref.read(pokedexProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: switch (state) {
        // ローディング状態
        PokedexLoading() => PokedexLoadingContents(
            state: state,
            notifier: notifier,
          ),
        // 読み込みエラー状態
        PokedexLoadingError() => PokedexLoadingErrorContents(
            state: state,
            notifier: notifier,
          ),
        // ポケモン一覧取得済済状態
        PokedexObtained() => PokedexObtainedContents(
            state: state,
            notifier: notifier,
          ),
      },
    );
  }
}
