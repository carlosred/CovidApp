import 'package:covid_app/presentation/controllers/states_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/contants.dart';
import '../widgets/state_tile_widget.dart';

class StatesPage extends ConsumerStatefulWidget {
  const StatesPage({super.key});

  @override
  ConsumerState<StatesPage> createState() => _StatesPageState();
}

class _StatesPageState extends ConsumerState<StatesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(statesPageControllerProvider.notifier).getCovidStates();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var statesPageController = ref.watch(statesPageControllerProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          Constants.detailPerRegion,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: statesPageController.when(
            data: (data) {
              if (data != null) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return StateTileWidget(
                      width: width,
                      height: height,
                      state: data[index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    strokeWidth: 3,
                  ),
                );
              }
            },
            error: (error, stackTrace) => Center(
                  child: Text(
                    '${Constants.error}${error.toString()}',
                  ),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    strokeWidth: 3,
                  ),
                )),
      ),
    );
  }
}
