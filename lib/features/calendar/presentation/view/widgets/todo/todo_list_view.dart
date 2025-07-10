// import 'package:sworks_mobile/core/extension/date_time_formatt_extension.dart';
// import 'package:sworks_mobile/features/site/presentation/providers/site_providers_di.dart';
// import 'package:sworks_mobile/features/calendar/data/models/todo_model.dart';
// import 'package:sworks_mobile/features/calendar/presentation/providers/calendar_providers_di.dart';
// import 'package:sworks_mobile/features/calendar/presentation/view/widgets/todo_animation_contents.dart';
// import 'package:sworks_mobile/features/calendar/presentation/view/widgets/todo_detail_bottom_sheet.dart';
// import 'package:sworks_mobile/features/calendar/presentation/view/widgets/todo_sliver_header_delegate.dart';
// import 'package:sworks_mobile/features/provider/date/date_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TodoListView extends ConsumerStatefulWidget {
//   const TodoListView({super.key});

//   @override
//   ConsumerState<TodoListView> createState() => _TodoListViewState();
// }

// class _TodoListViewState extends ConsumerState<TodoListView> {
//   bool isChecked = false;
//   ScrollController scrollController = ScrollController();
//   bool _siteExpanded = true;
//   bool _personalExpanded = true;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(calendarViewModelProvider.notifier).initState();
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   void _togglesiteExpanded() {
//     setState(() {
//       _siteExpanded = !_siteExpanded;
//     });
//   }

//   void _togglePersonalExpanded() {
//     setState(() {
//       _personalExpanded = !_personalExpanded;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedDate = ref.watch(dateProvider).selectedDate;
//     final todos = ref.watch(calendarViewModelProvider).todoList;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _dateTitle(selectedDate),
//         const SizedBox(height: 16),
//         _contents(todos),
//       ],
//     );
//   }

//   Widget _dateTitle(DateTime selectedDate) {
//     return Text(
//       selectedDate.toKoreanDate(),
//       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     );
//   }

//   Widget _contents(List<TodoModel> todos) {
//     // 사업장 할 일과 개인 할 일 분리
//     final siteTodos = todos
//         .where(
//           (todo) =>
//               todo.shareUserName.isNotEmpty &&
//               todo.shareUserName != todo.createUserName,
//         )
//         .toList();
//     final personalTodos = todos
//         .where(
//           (todo) =>
//               todo.shareUserName.isEmpty ||
//               todo.shareUserName == todo.createUserName,
//         )
//         .toList();

//     return Expanded(
//       child: CustomScrollView(
//         controller: scrollController,
//         slivers: [
//           // 1. 사업장 할 일 헤더 (고정)
//           TodoSliverHeader(
//             pinned: true,
//             title: '사업장 할 일',
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             onTap: _togglesiteExpanded,
//             isExpanded: _siteExpanded,
//             height: 56.0,
//           ),

//           // 2. 사업장 할 일 목록
//           TodoAnimationContents(
//             isExpanded: _siteExpanded,
//             todos: siteTodos,
//             onTap: (index) {
//               ref
//                   .read(siteSelectionViewModelProvider.notifier)
//                   .getsiteLocations();
//             },
//             onChanged: (index, value) {
//               final originalIndex = todos.indexOf(siteTodos[index]);
//               ref
//                   .read(calendarViewModelProvider.notifier)
//                   .checkTodo(originalIndex, value!);
//             },
//           ),

//           // 3. 개인 할 일 헤더 (고정)
//           TodoSliverHeader(
//             pinned: true,
//             title: '개인 할 일',
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             onTap: _togglePersonalExpanded,
//             isExpanded: _personalExpanded,
//             height: 56.0,
//           ),

//           // 4. 개인 할 일 목록
//           TodoAnimationContents(
//             isExpanded: _personalExpanded,
//             todos: personalTodos,
//             onTap: (index) {
//               final originalIndex = todos.indexOf(personalTodos[index]);
//               showTodoDetailBottomSheet(context, originalIndex);
//             },
//             onChanged: (index, value) {
//               final originalIndex = todos.indexOf(personalTodos[index]);
//               ref
//                   .read(calendarViewModelProvider.notifier)
//                   .checkTodo(originalIndex, value!);
//             },
//           ),

//           // 5. 하단 여백
//           const SliverToBoxAdapter(child: SizedBox(height: 20)),
//         ],
//       ),
//     );
//   }
// }
