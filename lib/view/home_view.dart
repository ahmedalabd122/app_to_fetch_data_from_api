import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/speakers_data_controller.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(getDataFuture);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Vikings Speakers"),
      ),
      body: viewModel.listDataModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.listDataModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                viewModel.listDataModel[index].profilePicture),
                            radius: 120,
                            onBackgroundImageError: (e, s) {
                              debugPrint('image issue, $e,$s');
                            },
                          ),
                          Text(
                            viewModel.listDataModel[index].fullName,
                            style: const TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            viewModel.listDataModel[index].tagLine,
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
