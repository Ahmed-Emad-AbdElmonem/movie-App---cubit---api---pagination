import 'package:movies_app/screens/movies/movie_model.dart';

class MoviesStetes {}

class GetMoviesLoadingStetes extends MoviesStetes {}

class GetMoviesErrorStetes extends MoviesStetes {
  final String errormsg;

  GetMoviesErrorStetes({required this.errormsg});
}

// pagination states
class GetMoviesFromPginationLoadingStetes extends MoviesStetes {}

class GetMoviesFromPginationErrorgStetes extends MoviesStetes {
  final String errormsg;

  GetMoviesFromPginationErrorgStetes(this.errormsg);
}

// للكل
class GetMoviesSuccessStetes extends MoviesStetes {
  final List<MovieModel> movieslist;

  GetMoviesSuccessStetes({required this.movieslist});
}
