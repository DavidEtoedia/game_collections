import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/presentation/ui/cubit/appstate_cubit.dart';
import 'package:game_collections/presentation/ui/widget/list%20widget/list_view_widget.dart';
import 'package:game_collections/presentation/ui/widget/purchase%20view/purchased_grid_view.dart';
import 'package:game_collections/presentation/ui/widget/purchase%20view/purchased_list_view.dart';
import 'package:game_collections/presentation/util/space_util.dart';
import '../widget/list widget/grid_list_widget.dart';

class NewTabView extends StatefulWidget {
  const NewTabView({Key? key}) : super(key: key);

  @override
  State<NewTabView> createState() => _NewTabViewState();
}

class _NewTabViewState extends State<NewTabView> with TickerProviderStateMixin {
  late TabController _tabController;
  bool isTapped = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    final view = context.watch<ViewStateCubit>().state;

    return Scaffold(
        // backgroundColor: Colors.black45,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0Xff29282b),
                Color(0Xff1b2231),
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 150,
                    top: 7,
                    child: Container(
                      height: 47,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0Xff1d1d1f)),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              // padding: const EdgeInsets.only(left: 21, right: 18),
                              height: 40,
                              width: 200,
                              child: TabBar(
                                isScrollable: false,
                                controller: _tabController,
                                labelColor: Colors.white,
                                labelStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                unselectedLabelStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                unselectedLabelColor: Colors.white,
                                labelPadding: EdgeInsets.zero,
                                indicatorPadding: EdgeInsets.zero,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0Xff29282b),
                                ),
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      'played',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Purchased',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: view == false
                                    ? const Color(0Xff1d1d1f)
                                    : Colors.transparent,
                              ),
                              child: InkWell(
                                onTap: () {
                                  context.read<ViewStateCubit>().toggleView();
                                },
                                child: const Icon(
                                  Icons.grid_view,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Space(10),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: view == true
                                    ? const Color(0Xff1d1d1f)
                                    : Colors.transparent,
                              ),
                              child: InkWell(
                                onTap: () {
                                  isTapped = !isTapped;
                                  context.read<ViewStateCubit>().toggleViews();
                                },
                                child: const Icon(
                                  Icons.list,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Space(15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 645,
                          // color: Colors.grey,
                          child:
                              TabBarView(controller: _tabController, children: [
                            if (view == false) ...[
                              const GameGridView(),
                              const PurchasedGridView()
                            ] else ...[
                              const GameListView(),
                              const PurchasedListView()
                            ]

                            // TechTab(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
