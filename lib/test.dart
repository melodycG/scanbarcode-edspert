// import 'dart:async';

// import 'package:_samples2/networking.dart';

// class Unsplash {
//   static const _apiKey = '11111111111111111111111111111';
//   static const _url = 'https://api.unsplash.com/photos/random/?client_id=$_apiKey';

//   static FutureOr<void> fetchRandomImage() async {
//     print('Start fetching...\n');
//     await NetService.getJson<Map<String, dynamic>>(_url)
//       .then((response) => print(response))
//       .whenComplete(() => print('\nFetching done!'));
//   }
// }

// void main(List<String> args) async {
//   await Unsplash.fetchRandomImage();
//   print('Done!');
// }