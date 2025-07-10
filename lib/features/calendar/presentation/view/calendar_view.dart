import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:sworks_mobile/features/calendar/presentation/providers/calendar_providers_di.dart';
import 'package:sworks_mobile/features/calendar/presentation/viewmodels/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key});

  @override
  ConsumerState<CalendarView> createState() => _State();
}

class _State extends ConsumerState<CalendarView> {
  /// 16진수 색상 문자열을 Color 객체로 변환하는 함수

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(calendarViewModelProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calendarViewModelProvider);
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: _tableCalendar(state),
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: _todo(state),
          ),
        ),
      ],
    );
  }

  TableCalendar<dynamic> _tableCalendar(CalendarState state) {
    return TableCalendar(
      eventLoader: (day) {
        final utcDay = DateTime.utc(day.year, day.month, day.day);
        return ref
            .read(calendarViewModelProvider.notifier)
            .getSelectedItems(utcDay);
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          if (events.isEmpty) {
            return null;
          }
          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index] as CalendarEventEntity;
                final color = ref
                    .read(calendarViewModelProvider.notifier)
                    .getColorFromHex(event.viewColor);
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                );
              },
            ),
          );
        },
      ),
      calendarStyle: CalendarStyle(
        // 오늘 날짜
        todayDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(color: Colors.black),
        selectedDecoration: BoxDecoration(
          color: primaryColor.withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(color: Colors.black),
        markersAlignment: Alignment.bottomCenter,
        markersAnchor: 0.5,
        markersMaxCount: 4,
      ),
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
      focusedDay: state.focusDay,
      firstDay: state.firstDay,
      lastDay: state.lastDay,
      onDaySelected: (selectedDay, focusedDay) {
        ref
            .read(calendarViewModelProvider.notifier)
            .selectCalendarDay(selectedDay);
      },
      selectedDayPredicate: (day) => isSameDay(day, state.focusDay),
    );
  }

  Widget _todo(CalendarState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${state.focusDay.month}월 ${state.focusDay.day}일 할 일',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: DragTarget<String>(
            onAcceptWithDetails: (data) {},
            builder: (context, candidateData, rejectedData) {
              if (state.selectedItems.isEmpty) {
                return Center(
                  child: Text(
                    candidateData.isNotEmpty ? '여기에 드롭하세요' : '할 일이 없습니다.',
                    style: TextStyle(
                      color: candidateData.isNotEmpty
                          ? Colors.green.shade700
                          : Colors.grey.shade600,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.selectedItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: LongPressDraggable<String>(
                      data: state.selectedItems[index].title,
                      feedback: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            state.selectedItems[index].title,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      childWhenDragging: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.selectedItems[index].title,
                                style: TextStyle(color: Colors.grey.shade400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.drag_indicator, color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                state.selectedItems[index].title,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
