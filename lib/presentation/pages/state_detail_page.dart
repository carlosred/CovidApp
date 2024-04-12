import 'package:covid_app/presentation/controllers/state_detail_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/contants.dart';

class StateDetailPage extends ConsumerStatefulWidget {
  const StateDetailPage({required this.state, super.key});
  final String state;
  @override
  ConsumerState<StateDetailPage> createState() => _StateDetailPageState();
}

class _StateDetailPageState extends ConsumerState<StateDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(stateDetailPageControllerProvider.notifier).getCovidStateDetail(
            covidState: widget.state.toLowerCase(),
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var stateDetailPageController =
        ref.watch(stateDetailPageControllerProvider);
    return stateDetailPageController.when(
      data: (data) {
        if (data != null) {
          return Scaffold(
            appBar: AppBar(
              elevation: 3,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25.0,
                  color: Colors.grey[700],
                ),
              ),
              shadowColor: Colors.grey,
              surfaceTintColor: Colors.white,
              title: Text(
                data.name,
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          Constants.notes,
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(data.notes),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              Constants.website,
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              data.covid19Site,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              elevation: 3,
              leading: Icon(
                Icons.arrow_back_ios,
                size: 25.0,
                color: Colors.grey[700],
              ),
              shadowColor: Colors.grey,
              surfaceTintColor: Colors.white,
              title: const Text(
                Constants.loading,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: SizedBox(
              height: height,
              width: width,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Colors.orange,
                  ),
                  strokeWidth: 3,
                ),
              ),
            ),
          );
        }
      },
      loading: () => Scaffold(
        appBar: AppBar(
          elevation: 3,
          leading: Icon(
            Icons.arrow_back_ios,
            size: 25.0,
            color: Colors.grey[700],
          ),
          shadowColor: Colors.grey,
          surfaceTintColor: Colors.white,
          title: const Text(
            Constants.loading,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
            height: height,
            width: width,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.orange,
                ),
                strokeWidth: 3,
              ),
            )),
      ),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(
          elevation: 3,
          leading: Icon(
            Icons.arrow_back_ios,
            size: 25.0,
            color: Colors.grey[700],
          ),
          shadowColor: Colors.grey,
          surfaceTintColor: Colors.white,
          title: Text(
            '${Constants.error}${error.toString()}',
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text('${Constants.error} ${error.toString()}'),
          ),
        ),
      ),
    );
  }
}
