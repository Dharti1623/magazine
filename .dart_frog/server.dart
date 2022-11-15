// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/index.dart' as index;
import '../routes/magazine/index.dart' as magazine_index;
import '../routes/magazine/[id].dart' as magazine_$id;

import '../routes/_middleware.dart' as middleware;

void main() => hotReload(createServer);

Future<HttpServer> createServer() {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, ip, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/magazine', (context) => buildMagazineHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildMagazineHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => magazine_index.onRequest(context,))..all('/<id>', (context,id,) => magazine_$id.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}
