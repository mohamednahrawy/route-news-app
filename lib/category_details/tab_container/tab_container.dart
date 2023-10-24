import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:route_news_project/category_details/tab_container/cubit/tab_container_view_model.dart';
import 'package:route_news_project/category_details/tab_container/tab_item.dart';
import '../../models/category.dart';
import '../cubit/category_details_view_model.dart';
import '../cubit/states.dart';
import '../news_container/news_container.dart';

class TabContainer extends StatefulWidget {
  final Category? category;

  const TabContainer({super.key, required this.category});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  TabContainerViewModel viewModel = TabContainerViewModel();
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategoryId(widget.category!.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <TabContainerViewModel, SourceStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(child: CircularProgressIndicator(color: Theme
                .of(context)
                .primaryColor,),);
          } else if (state is SourceErrorState) {
            return Column(children: [
              Text(state.errorMessage),
            ],);
          } else {
            return DefaultTabController(
                length:,
                child: Column(
                    children: [
                    TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    onTap: (index) {
                      selectedIndex = index;
                      setState(() {});
                    },
                    tabs: state.
                    .map((source) => TabItem(
            isSelected: selectedIndex ==
            viewModel.sourcesList?.indexOf(source),
          source: source))
              .toList()),
          NewsContainer(
          source: viewModel.sourcesList![selectedIndex
          ]
          ,
          )
          ]
          );
        }
        }
    );
  }
}
//ChangeNotifierProvider(
//       create: (context) => viewModel,
//       child:
//           Consumer<TabContainerViewModel>(builder: (context, viewModel, child) {
//         if (viewModel.errorMessage != null) {
//           return Column(
//             children: [
//               Text(viewModel.errorMessage ?? ''),
//               ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
//             ],
//           );
//         } else if (viewModel.sourcesList == null) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Theme.of(context).primaryColor,
//             ),
//           );
//         } else {
//           return DefaultTabController(
//             length: viewModel.sourcesList?.length ?? 0,
//             child: Column(
//               children: [
//                 TabBar(
//                     isScrollable: true,
//                     indicatorColor: Colors.transparent,
//                     onTap: (index) {
//                       selectedIndex = index;
//                       setState(() {});
//                     },
//                     tabs: viewModel.sourcesList!
//                         .map((source) => TabItem(
//                             isSelected: selectedIndex ==
//                                 viewModel.sourcesList?.indexOf(source),
//                             source: source))
//                         .toList()),
//                 NewsContainer(
//                   source: viewModel.sourcesList![selectedIndex],
//                 )
//               ],
//             ),
//           );
//         }
//       }),
//     );