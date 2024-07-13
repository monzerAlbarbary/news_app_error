// screens/news_screen.dart
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:copy/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grand News',
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 24),
        ),
        centerTitle: true,
        leading: Icon(Icons.drag_handle_outlined),
        actions: [
          Icon(Icons.notifications),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            NewsBloc(RepositoryProvider.of<NewsService>(context))
              ..add(FetchAllNews()),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: CategoryNews.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  CategoryNews[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff989898)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height / 3,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.1,
                        ),
                        items: state.news.map((newsItem) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: newsItem.urlToImage.isNotEmpty
                                    ? Image.network(
                                        newsItem.urlToImage,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'asset/image/placeholder.png',
                                          );
                                        },
                                      )
                                    : Image.asset('asset/image/placeholder.png',
                                        fit: BoxFit.cover),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest News',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'See More',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          final news = state.news[index];
                          return SizedBox(
                            height: 100,
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  news.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(news.description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                trailing: news.urlToImage.isNotEmpty
                                    ? Container(
                                        height: double.infinity,
                                        child: Image.network(
                                          news.urlToImage,
                                          width: 50,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'asset/image/placeholder.png',
                                            );
                                          },
                                        ),
                                      )
                                    : Image.asset('asset/image/placeholder.png',
                                        width: 50, fit: BoxFit.cover),
                                onTap: () {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is NewsError) {
              return Center(
                  child: Text('Failed to load news: ${state.message}'));
            } else {
              return Center(child: Text('No news found'));
            }
          },
        ),
      ),
    );
  }
}

// class NewsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               Navigator.pushNamed(context, '/search');
//             },
//           ),
//         ],
//       ),
//       body: BlocProvider(
//         create: (context) => NewsBloc(RepositoryProvider.of<NewsService>(context))..add(FetchAllNews()),
//         child: BlocBuilder<NewsBloc, NewsState>(
//           builder: (context, state) {
//             if (state is NewsLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is NewsLoaded) {
//               return ListView.builder(
//                 itemCount: state.news.length,
//                 itemBuilder: (context, index) {
//                   final news = state.news[index];
//                   return ListTile(
//                     title: Text(news.title),
//                     subtitle: Text(news.description),
//                     leading: news.urlToImage != null
//                         ? Image.network(news.urlToImage, width: 50, fit: BoxFit.cover)
//                         : null,
//                     onTap: () {
//                       // Navigate to news details page if needed
//                     },
//                   );
//                 },
//               );
//             } else if (state is NewsError) {
//               return Center(child: Text('Failed to load news: ${state.message}'));
//             } else {
//               return Center(child: Text('No news found'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Grand News',
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.w600, height: 24),
//           ),
//           centerTitle: true,
//           leading: Icon(Icons.drag_handle_outlined),
//           actions: [
//             Icon(Icons.notifications),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: SizedBox(
//                   height: 30,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: CategoryNews.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(right: 50.0),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Text(
//                             CategoryNews[index],
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xff989898)),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
//                 child: CarouselSlider(
//                   options: CarouselOptions(
//                     height: MediaQuery.of(context).size.height / 3,
//                     autoPlay: true,
//                     enlargeCenterPage: true,
//                     enlargeFactor: 0.1,
//                   ),
//                   items: [1, 2, 3, 4, 5].map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                             width: MediaQuery.of(context).size.width,
//                             margin: EdgeInsets.symmetric(horizontal: 5.0),
//                             decoration: BoxDecoration(color: Colors.amber),
//                             child: Text(
//                               'text $i',
//                               style: TextStyle(fontSize: 16.0),
//                             ));
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Latest News',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   ),
//                   Text('See  More',
//                       style:
//                           TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
//                 ],
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return SizedBox(
//                       height: 100,
//                       child: Card(
//                         child: ListTile(

//                           title: Text('ddddddddddd'),
//                           subtitle: Text('asfddd'),
//                           trailing: Icon(Icons.abc),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

List CategoryNews = [
  'All',
  'sports',
  'health',
  'general',
  'technology',
  'business',
];
