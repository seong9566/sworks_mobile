// import 'package:sworks_mobile/core/theme/app_theme.dart';
// import 'package:sworks_mobile/features/calendar/presentation/view/widgets/calendar_drag_example.dart';
// import 'package:sworks_mobile/features/calendar/presentation/view/widgets/todo_list_view.dart';
// import 'package:flutter/material.dart';

// class CustomCalendarView extends StatefulWidget {
//   const CustomCalendarView({super.key});

//   @override
//   State<CustomCalendarView> createState() => _CustomCalendarViewState();
// }

// class _CustomCalendarViewState extends State<CustomCalendarView>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;

//   final TextStyle unSelectTabText = TextStyle(
//     fontSize: 20,
//     color: unSelectColor,
//     fontWeight: FontWeight.bold,
//   );
//   final TextStyle selectTabText = TextStyle(
//     fontSize: 20,
//     color: selectColor,
//     fontWeight: FontWeight.bold,
//   );
//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 24),
//           _tabBar(),
//           SizedBox(height: 24),
//           _tabBarView(),
//         ],
//       ),
//     );
//   }

//   Widget _tabBarView() {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: defaultHPadding),
//         child: TabBarView(
//           controller: tabController,
//           children: [
//             TodoListView(),
//             CalendarDragDropExample(),
//             // /// Week
//             // Center(child: Text("주간")),

//             /// Month
//             Center(child: Text("월별")),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _tabBar() {
//     return Center(
//       child: TabBar(
//         controller: tabController,
//         unselectedLabelStyle: unSelectTabText,
//         labelStyle: selectTabText,
//         labelPadding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 12),
//         indicatorSize: TabBarIndicatorSize.label,
//         indicator: UnderlineTabIndicator(
//           borderSide: BorderSide(width: 3, color: indicatorColor),
//         ),
//         tabs: [Text('일별'), Text('주별'), Text('월별')],
//       ),
//     );
//   }
// }
