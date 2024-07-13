import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedFilter = 'ALL';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(FetchAllNews());
  }

  void _onFilterChanged(String filter) {
    setState(() {
      selectedFilter = filter;
    });
    // Add logic to fetch/filter news based on selected filter if necessary
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    BlocProvider.of<NewsBloc>(context).add(FetchAllNews());
                  } else {
                    BlocProvider.of<NewsBloc>(context).add(SearchNews(value));
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffD7D7D7),
                  border: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Technology Interviews',
                  suffixIcon: Icon(Icons.search, color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterButton(
                    text: 'ALL',
                    isSelected: selectedFilter == 'ALL',
                    onTap: () => _onFilterChanged('ALL'),
                  ),
                  FilterButton(
                    text: 'NEWS',
                    isSelected: selectedFilter == 'NEWS',
                    onTap: () => _onFilterChanged('NEWS'),
                  ),
                  FilterButton(
                    text: 'PHOTOS',
                    isSelected: selectedFilter == 'PHOTOS',
                    onTap: () => _onFilterChanged('PHOTOS'),
                  ),
                  FilterButton(
                    text: 'VIDEOS',
                    isSelected: selectedFilter == 'VIDEOS',
                    onTap: () => _onFilterChanged('VIDEOS'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is NewsLoaded) {
                    return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        final news = state.news[index];
                        return SizedBox(
                          height: 150,
                          child: Card(
                            child: ListTile(
                              title: Text(
                                news.title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(news.description,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                              trailing: news.urlToImage.isNotEmpty
                                  ? Container(
                                      height: 150,
                                      width: 150,
                                      child: Image.network(
                                        news.urlToImage,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'asset/image/placeholder.png',
                                          );
                                        },
                                      ),
                                    )
                                  : Container(
                                      height: 150,
                                      width: 150,
                                      child: Image.asset(
                                          'asset/image/placeholder.png',
                                          fit: BoxFit.fitWidth),
                                    ),
                              onTap: () {},
                            ),
                          ),
                        );
                      
                      },
                    );
                  } else if (state is NewsError) {
                    return Center(
                        child: Text('Failed to load news: ${state.message}'));
                  } else {
                    return Center(child: Text('No news available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
