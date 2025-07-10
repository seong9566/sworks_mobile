// import 'package:sworks_mobile/core/theme/app_theme.dart';
// import 'package:sworks_mobile/features/calendar/data/models/todo_model.dart';
// import 'package:sworks_mobile/features/calendar/presentation/providers/calendar_providers_di.dart';
// import 'package:sworks_mobile/features/calendar/presentation/view/widgets/todo_card_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// /// todoTitle : TODO의 제목
// /// createUserName : TODO를 작성한 사용자 이름
// /// todoDetailModel : TODO의 상세 내용
// /// index : TODO의 인덱스

// void showTodoDetailBottomSheet(BuildContext context, int todoIndex) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true, // 화면 전체 높이를 컨트롤할 수 있게
//     backgroundColor: Colors.transparent, // 바깥쪽 배경 투명
//     builder: (context) => Consumer(
//       builder: (context, ref, child) => _buildSheet(context, ref, todoIndex),
//     ),
//   );
// }

// Widget _buildSheet(BuildContext context, WidgetRef ref, int todoIndex) {
//   final todo = ref.watch(calendarViewModelProvider).todoList[todoIndex];
//   final height = MediaQuery.of(context).size.height * 0.5;

//   return Container(
//     height: height,
//     padding: EdgeInsets.symmetric(horizontal: defaultHPadding),
//     decoration: const BoxDecoration(
//       color: Color.fromRGBO(255, 255, 255, 1),
//       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // 상단 드래그 핸들
//         const SizedBox(height: 12),
//         _topHandle(),
//         const SizedBox(height: 16),

//         // 제목 및 작성자
//         _title(todo),
//         const SizedBox(height: 12),

//         Divider(height: 4, color: Color(0xFF61758A)),
//         const SizedBox(height: 12),

//         // TODO List 내용
//         contentList(todo.todoDetailModel, todoIndex, ref),
//       ],
//     ),
//   );
// }

// Widget _title(TodoModel todo) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Text(
//         todo.title,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//       SizedBox(width: 12),
//       Text(
//         '작성자 : ${todo.createUserName}',
//         style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
//       ),
//     ],
//   );
// }

// Widget contentList(
//   List<TodoDetailModel> todoDetailModel,
//   int todoIndex,
//   WidgetRef ref,
// ) {
//   return Expanded(
//     child: ListView(
//       shrinkWrap: true,
//       children: List.generate(
//         todoDetailModel.length,
//         (detailIndex) => TodoCardItem(
//           title: todoDetailModel[detailIndex].detailTitle,
//           onChanged: (value) {
//             ref
//                 .read(calendarViewModelProvider.notifier)
//                 .checkTodoDetail(todoIndex, detailIndex, value!);
//           },
//           isChecked: todoDetailModel[detailIndex].isChecked,
//         ),
//       ),
//     ),
//   );
// }

// Widget _topHandle() {
//   return Center(
//     child: Container(
//       width: 40,
//       height: 4,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade400,
//         borderRadius: BorderRadius.circular(2),
//       ),
//     ),
//   );
// }
