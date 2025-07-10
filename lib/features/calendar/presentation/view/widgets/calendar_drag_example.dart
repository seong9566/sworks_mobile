import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDragDropExample extends StatefulWidget {
  const CalendarDragDropExample({super.key});

  @override
  State<CalendarDragDropExample> createState() =>
      _CalendarDragDropExampleState();
}

class _CalendarDragDropExampleState extends State<CalendarDragDropExample> {
  Map<DateTime, List<String>> events = {
    DateTime.utc(2025, 6, 12): ['강당 청소', '회의 준비'],
    DateTime.utc(2025, 6, 13): ['로비 청소', '점심 회식', '비상 점검'],
    DateTime.utc(2025, 6, 14): ['정기 소독', '회의록 정리'],
    DateTime.utc(2025, 6, 15): ['주차장 청소'],
    DateTime.utc(2025, 6, 16): ['휴가자 관리', '기기 점검'],
    DateTime.utc(2025, 6, 17): ['소방 훈련', '재고 확인', '프로젝트 회의'],
    DateTime.utc(2025, 6, 18): ['사무실 대청소', '설비 점검'],
    DateTime.utc(2025, 6, 19): ['야유회 준비', '서류 제출'],
    DateTime.utc(2025, 6, 20): ['월간 업무보고', '개인 면담', '외부 미팅'],
  };

  List<String> selectedEvents = [];
  List<String> juneEvents = [];
  DateTime focusDay = DateTime.now();
  DateTime firstDay = DateTime.utc(2025, 6, 1);
  DateTime lastDay = DateTime.utc(2025, 6, 30);

  @override
  void initState() {
    super.initState();
    // 초기 날짜 선택 시 이벤트 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onDaySelected(focusDay, focusDay);
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      focusDay = selectedDay;
      // UTC 기준으로 날짜 비교를 위해 변환
      final selectedUtc = DateTime.utc(
        selectedDay.year,
        selectedDay.month,
        selectedDay.day,
      );

      // 해당 날짜의 이벤트 가져오기
      selectedEvents = [];
      events.forEach((date, eventList) {
        if (isSameDay(date, selectedUtc)) {
          selectedEvents = List.from(eventList);
        }
      });
    });
  }

  // 이벤트를 드래그하여 juneEvents로 이동
  void moveEventToJuneEvents(String event) {
    setState(() {
      // 선택된 이벤트에서 제거
      selectedEvents.remove(event);

      // 원본 이벤트 맵에서도 제거
      final selectedUtc = DateTime.utc(
        focusDay.year,
        focusDay.month,
        focusDay.day,
      );
      events.forEach((date, eventList) {
        if (isSameDay(date, selectedUtc)) {
          eventList.remove(event);
        }
      });

      // juneEvents에 추가
      juneEvents.add(event);
    });
  }

  // 이벤트를 드래그하여 selectedEvents로 이동
  void moveEventToSelectedEvents(String event) {
    setState(() {
      // 전체 일정에서 제거
      juneEvents.remove(event);

      // 선택된 날짜의 이벤트에 추가
      selectedEvents.add(event);

      // 원본 이벤트 맵에 추가
      final selectedUtc = DateTime.utc(
        focusDay.year,
        focusDay.month,
        focusDay.day,
      );
      if (events.containsKey(selectedUtc)) {
        events[selectedUtc]!.add(event);
      } else {
        events[selectedUtc] = [event];
      }
    });
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tableCalendar(),
          const SizedBox(height: 16),
          // 날짜의 할 일
          _todo(),
          const SizedBox(height: 16),
          // 드래그 타겟이 될 영역
          _dragTarget(),
        ],
      ),
    );
  }

  Widget _dragTarget() {
    return DragTarget<String>(
      onAcceptWithDetails: (data) {
        moveEventToJuneEvents(data.data);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          padding: const EdgeInsets.all(12.0),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: candidateData.isNotEmpty
                  ? Colors.blue
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '6월 전체 일정',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: juneEvents.isEmpty
                    ? Center(
                        child: Text(
                          candidateData.isNotEmpty
                              ? '여기에 드롭하세요'
                              : '일정을 이곳으로 드래그하세요',
                          style: TextStyle(
                            color: candidateData.isNotEmpty
                                ? Colors.blue.shade700
                                : Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            juneEvents.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: LongPressDraggable<String>(
                                data: juneEvents[index],
                                feedback: Material(
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      juneEvents[index],
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
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          juneEvents[index],
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  color: Colors.white,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.drag_indicator,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            juneEvents[index],
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              juneEvents.removeAt(index);
                                            });
                                          },
                                          iconSize: 20,
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _todo() {
    return DragTarget<String>(
      onAcceptWithDetails: (data) {
        moveEventToSelectedEvents(data.data);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: candidateData.isNotEmpty
                  ? Colors.green
                  : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${focusDay.month}월 ${focusDay.day}일 할 일',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              selectedEvents.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          candidateData.isNotEmpty ? '여기에 드롭하세요' : '할 일이 없습니다.',
                          style: TextStyle(
                            color: candidateData.isNotEmpty
                                ? Colors.green.shade700
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      constraints: BoxConstraints(maxHeight: 150),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            selectedEvents.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: LongPressDraggable<String>(
                                data: selectedEvents[index],
                                feedback: Material(
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      selectedEvents[index],
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
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          selectedEvents[index],
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                          ),
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
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.drag_indicator,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          selectedEvents[index],
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  TableCalendar<dynamic> _tableCalendar() {
    return TableCalendar(
      // 캘린더 디자인
      calendarStyle: CalendarStyle(
        // 마커 디자인
        markerSize: 6,
        markersAutoAligned: true,
        markersAlignment: Alignment.bottomCenter,
        markerDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
      focusedDay: focusDay,
      firstDay: firstDay,
      lastDay: lastDay,
      eventLoader: (day) =>
          events[DateTime.utc(day.year, day.month, day.day)] ?? [],
      onDaySelected: onDaySelected,
      selectedDayPredicate: (day) => isSameDay(day, focusDay),
    );
  }
}
