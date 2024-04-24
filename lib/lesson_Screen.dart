
import 'package:flutter/material.dart';
import 'apiservice.dart';
import 'lesson_model.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late List<Items> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }
  @override
  Future<void> _loadLessons() async {
    try {
      LessonModel response = await LessonApiService.fetchLessons();
      setState(() {
        _lessons = response.items!;
             });
    } catch (e) {
      print('Error loading lessons:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lessons'),
        ),
        body: _lessons == null || _lessons.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _lessons!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text('Id:${_lessons[index].id}'),
                        Text('name:${_lessons[index].name}'),
                        Text('duration:${_lessons[index].duration}'),
                        Text('category:${_lessons[index].category}'),
                        Text('locked:${_lessons[index].locked}'),
                        Text('createdAt:${_lessons[index].createdAt}'),
                      ],
                    ),
                  );
                }));
  }
}
