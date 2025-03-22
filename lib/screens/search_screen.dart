import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_list_item.dart';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _debouncer = Debouncer();
  final duration = Duration(milliseconds: 500);
  late CourseProvider _courseProvider;

  @override
  void initState() {
    super.initState();
    _courseProvider = Provider.of<CourseProvider>(context, listen: false);
    _courseProvider.loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Courses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by course or university',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
               /* _debouncer.run(() {
                  _courseProvider.searchCourses(query);
                });*/
               _debouncer.debounce(
               duration: duration,
               onDebounce: () {
                 _courseProvider.searchCourses(query);
               });
              },
            ),
          ),
          Expanded(
            child: Consumer<CourseProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: provider.filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = provider.filteredCourses[index];
                    return CourseListItem(
                      course: course,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(course: course),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}