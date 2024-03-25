// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';
// import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
// import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
// import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
//
// class UnityIosScreen extends StatefulWidget {
//   const UnityIosScreen({Key? key}) : super(key: key);
//
//   @override
//   State<UnityIosScreen> createState() => _UnityIosScreenState();
// }
//
// class _UnityIosScreenState extends State<UnityIosScreen> {
//   UnityWidgetController? _unityWidgetController;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _unityWidgetController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('API Screen'),
//       ),
//       body: UnityWidget(
//         onUnityCreated: onUnityCreated,
//         onUnityMessage: onUnityMessage,
//         onUnitySceneLoaded: onUnitySceneLoaded,
//         fullscreen: false,
//         useAndroidViewSurface: false,
//       ),
//     );
//   }
//
//   void onUnityMessage(message) {
//     print('Received message from unity: ${message.toString()}');
//   }
//
//   void onUnitySceneLoaded(SceneLoaded? scene) {
//     if (scene != null) {
//       print('Received scene loaded from unity: ${scene.name}');
//       print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
//     } else {
//       print('Received scene loaded from unity: null');
//     }
//   }
//
//   void onUnityCreated(controller) async {
//     print('onUnityCreated---------------');
//     _unityWidgetController = controller;
//
//     final Future<Map<String, dynamic>> userBalances =
//         RepositoryProvider.of<WalletRepository>(context).getUnityBalances();
//     final Future<Map<String, dynamic>> userData =
//         RepositoryProvider.of<UserRepository>(context).getUserJson();
//
//     Future.wait([userData, userBalances]).then((value) async {
//       final json = {}
//         ..addAll(value[0])
//         ..addAll(value[1]);
//       BlocProvider.of<AppCubit>(context).runUnity();
//
//       await Future.delayed(const Duration(seconds: 3));
//       _unityWidgetController!.postMessage(
//         'GameSession',
//         'SetIosUser',
//         jsonEncode(json),
//       );
//     });
//   }
// }
