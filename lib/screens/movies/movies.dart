import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movies_cubit.dart';
import 'package:movies_app/cubit/movies_states.dart';
import 'package:movies_app/screens/movies/item.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesCubit>(
      create: (context) {
        return MoviesCubit()..getdata();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('movies'),
          ),
          body: BlocBuilder<MoviesCubit, MoviesStetes>(
              buildWhen: (previous, current) =>
                  current is! GetMoviesFromPginationLoadingStetes &&
                  current is! GetMoviesFromPginationErrorgStetes,
              builder: (context, state) {
                if (state is GetMoviesLoadingStetes) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetMoviesErrorStetes) {
                  return Text(state.errormsg);
                } else if (state is GetMoviesSuccessStetes) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent &&
                          notification is ScrollUpdateNotification) {
                        print('loadinnnnnng');
                        final cubit = BlocProvider.of<MoviesCubit>(context);
                        cubit.getdata(fromLoading: true);
                      }
                      return true;
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.movieslist.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Item(
                          movie: state.movieslist[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const Text('un handeled state');
                }
              }),
          bottomNavigationBar: SafeArea(
            child: SizedBox(
              height: 60,
              child: BlocBuilder<MoviesCubit, MoviesStetes>(
                buildWhen: (previous, current) =>
                    current is GetMoviesFromPginationLoadingStetes ||
                    current is GetMoviesSuccessStetes ||
                    current is GetMoviesFromPginationErrorgStetes,
                builder: (context, state) {
                  if (state is GetMoviesFromPginationLoadingStetes) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
                  } else if (state is GetMoviesFromPginationErrorgStetes) {
                    return Center(
                      child: Text(state.errormsg),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          )),
    );
  }
}
