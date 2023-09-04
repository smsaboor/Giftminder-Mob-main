// import 'package:dio/dio.dart' ;
// import 'package:giftminder/config/config.dart';

// class Api {
//     // dio = Dio(); // with default Options
     
//     //dio.options.baseUrl = ConfigUrl.BaseUrl;
//     // Set default configs
//     // dio.options.baseUrl = 'https://www.xx.com/api';
//     // dio.options.connectTimeout = 5000; //5s
//     // dio.options.receiveTimeout = 3000;



//     // or new Dio with a BaseOptions instance.
//     // var options = BaseOptions(
//     //   baseUrl: 'https://www.xx.com/api',
//     //   connectTimeout: 5000,
//     //   receiveTimeout: 3000,
//     // );
//    // dio = Dio(options);


//   //  //var dio = Dio();
//   // //  dio instance to request token
//   // var tokenDio = Dio();
//   // String? csrfToken;
//   // dio.options.baseUrl = 'http://www.dtworkroom.com/doris/1/2.0.0/';
//   // tokenDio.options = dio.options;
//   // dio.interceptors.add(QueuedInterceptorsWrapper(
//   //   onRequest: (options, handler) {
//   //     print('send request：path:${options.path}，baseURL:${options.baseUrl}');
//   //     if (csrfToken == null) {
//   //       print('no token，request token firstly...');
//   //       tokenDio.get('/token').then((d) {
//   //         options.headers['csrfToken'] = csrfToken = d.data['data']['token'];
//   //         print('request token succeed, value: ' + d.data['data']['token']);
//   //         print(
//   //             'continue to perform request：path:${options.path}，baseURL:${options.path}');
//   //         handler.next(options);
//   //       }).catchError((error, stackTrace) {
//   //         handler.reject(error, true);
//   //       });
//   //     } else {
//   //       options.headers['csrfToken'] = csrfToken;
//   //       return handler.next(options);
//   //     }
//   //   },
//   //  ); 
    
// }

