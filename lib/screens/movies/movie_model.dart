class MovieModel {
  late String image, title, subTitle;

  late double rate;

  MovieModel(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.rate});

  MovieModel.fromJson(Map<String, dynamic> json) {
    image = json['backdrop_path'] == null
        ? 'https://img.freepik.com/free-vector/hand-drawn-404-error_23-2147739002.jpg?w=740&t=st=1691066368~exp=1691066968~hmac=c0670b2e067f6d0fd8728e4a899a1785fe7c38e9a6304f0b28633b105800d548'
        : "http://image.tmdb.org/t/p/original${json['backdrop_path']}";

    title = json['original_title'];
    subTitle = json['overview'];
    rate = double.parse(json['vote_average'].toString());
  }
}
