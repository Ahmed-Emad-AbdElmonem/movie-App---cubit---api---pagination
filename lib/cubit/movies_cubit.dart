import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movies_states.dart';
import 'package:movies_app/screens/movies/movie_model.dart';

class MoviesCubit extends Cubit<MoviesStetes> {
  MoviesCubit() : super(MoviesStetes());

  List<MovieModel> movieslist = [];

  int pageNumber = 1;

  getdata({bool fromLoading = false}) async {
    if (fromLoading) {
      emit(GetMoviesFromPginationLoadingStetes());
    } else {
      emit(GetMoviesLoadingStetes());
    }

    try {
      var res = await Dio().get(
          'https://api.themoviedb.org/3/discover/movie?api_key=b8cddc0fda1f27f8de8d6e0030a4ba9a&page=$pageNumber');
      var moviesListResponse = res.data['results'];
      print(moviesListResponse.toString());
      print('ffffffffffffffffffffff');
      for (var i = 0; i < moviesListResponse.length; i++) {
        var model = MovieModel.fromJson(moviesListResponse[i]);

        movieslist.add(model);
      }
      pageNumber++;
      print(pageNumber);
      emit(GetMoviesSuccessStetes(movieslist: movieslist));
    } on DioException catch (e) {
      if (fromLoading) {
        emit(GetMoviesFromPginationErrorgStetes(e.response!.data['errors'][0]));
      } else {
        emit(GetMoviesErrorStetes(errormsg: e.message.toString()));
      }
    }
  }
}

/* 
//fake data

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movies_states.dart';
import 'package:movies_app/screens/movies/movie_model.dart';

class MoviesCubit extends Cubit<MoviesStetes> {
  MoviesCubit():super(MoviesStetes());


List<MovieModel> movieslist = [
  /*  MovieModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnHtc-SkYyYsJMgdFJa61PWKV5upHS0zt6TC9XpocFYpUVK4wNErrwc0mp5AwglJ1DPzU&usqp=CAU',
        title: 'movie 1',
        subTitle: 'sub title 1',
        rate: 5),
    MovieModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnHtc-SkYyYsJMgdFJa61PWKV5upHS0zt6TC9XpocFYpUVK4wNErrwc0mp5AwglJ1DPzU&usqp=CAU',
        title: 'movie 2',
        subTitle: 'sub title 2',
        rate: 3.5),
    MovieModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnHtc-SkYyYsJMgdFJa61PWKV5upHS0zt6TC9XpocFYpUVK4wNErrwc0mp5AwglJ1DPzU&usqp=CAU',
        title: 'movie 3',
        subTitle: 'sub title 3',
        rate: 4),
    MovieModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnHtc-SkYyYsJMgdFJa61PWKV5upHS0zt6TC9XpocFYpUVK4wNErrwc0mp5AwglJ1DPzU&usqp=CAU',
        title: 'movie 4',
        subTitle: 'sub title 4',
        rate: 4.5),
    MovieModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnHtc-SkYyYsJMgdFJa61PWKV5upHS0zt6TC9XpocFYpUVK4wNErrwc0mp5AwglJ1DPzU&usqp=CAU',
        title: 'movie 5',
        subTitle: 'sub title 5',
        rate: 3),*/
  ];


   getdata() async {
    print('ffffffffffffffffffffff');
emit(GetMoviesLoadingStetes());
 
    try {
  var res = await Dio().get(
      'https://api.themoviedb.org/3/discover/movie?api_key=b8cddc0fda1f27f8de8d6e0030a4ba9a');
  var moviesListResponse = res.data['results']  ;
  print(moviesListResponse.toString());
  print('ffffffffffffffffffffff');
  for (var i = 0; i < moviesListResponse.length; i++) {
  
    var model =MovieModel.fromJson(moviesListResponse[i]);
   /* var model = MovieModel(
        image:"http://image.tmdb.org/t/p/original${moviesListResponse[i]['backdrop_path']}" ,
        title: moviesListResponse[i]['original_title'],
        subTitle: moviesListResponse[i]['overview'],
        rate:double.parse(moviesListResponse[i]['vote_average'].toString()) );
  */
        movieslist.add(model);
     }
} on DioException catch (e) {
   emit(GetMoviesErrorStetes());
}
    

  }
  
}
*/
