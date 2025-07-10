import 'package:sworks_mobile/features/calendar/data/models/todo_model.dart';
import 'package:sworks_mobile/features/calendar/presentation/view/widgets/todo/todo_card_item.dart';
import 'package:flutter/material.dart';

class TodoAnimationContents extends StatelessWidget {
  final bool isExpanded;
  final List<TodoModel> todos;
  final ValueChanged<int> onTap;
  final Function(int, bool?) onChanged;
  const TodoAnimationContents({
    super.key,
    required this.todos,
    required this.isExpanded,
    required this.onTap,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1.0,
              child: child,
            ),
          );
        },
        child: isExpanded
            ? todos.isEmpty
                  ? const Padding(
                      key: ValueKey('personalEmptyList'),
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(child: Text('등록된 개인 할 일이 없습니다.')),
                    )
                  : Padding(
                      key: const ValueKey('personalListExpanded'),
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: todos.map((todo) {
                          return GestureDetector(
                            onTap: () {
                              final originalIndex = todos.indexOf(todo);
                              onTap(originalIndex);
                            },
                            child: TodoCardItem(
                              title: todo.title,
                              onChanged: (value) {
                                final originalIndex = todos.indexOf(todo);
                                onChanged(originalIndex, value);
                              },
                              isChecked: todo.isChecked,
                            ),
                          );
                        }).toList(),
                      ),
                    )
            : const SizedBox.shrink(key: ValueKey('personalListCollapsed')),
      ),
    );
  }
}
