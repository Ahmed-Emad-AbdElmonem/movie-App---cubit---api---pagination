 

import 'package:flutter/material.dart';
import 'package:movies_app/screens/movies/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;
   const MovieDetailsScreen({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Movie Details'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white38),
      child: Column(
        children: [
          Image.network(
            movie.image,
             // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnHtc-SkYyYsJMgdFJa61PWKV5upHS0zt6TC9XpocFYpUVK4wNErrwc0mp5AwglJ1DPzU&usqp=CAU',
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                   movie.title ,
                //  maxLines: 1,
                //  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                 movie.subTitle ,
                 // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                     const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                      const SizedBox(
                      width: 3,
                    ),
                    Text(
                     // 'vote avg',
                     movie.rate.toString(),
                       
                      style:  const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ), 
        ],
      ),
    );
  }
}