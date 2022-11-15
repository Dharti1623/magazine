import 'package:dart_frog/dart_frog.dart';
import 'package:magazine_api/source/magazine_data_source.dart';

Future<Response> onRequest(RequestContext context, id) async {
  final dataRepository = context.read<MagazineDataSource>();
  final request = context.request;
  switch (request.method) {
    case HttpMethod.post:
    case HttpMethod.put:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response.json(body: {'message': 'Method not found'});
      break;
    case HttpMethod.delete:
      final magazines = await dataRepository.deleteMagazine(id.toString());
      return Response.json(body: {'message': magazines});
      break;
    case HttpMethod.get:
      final magazines = await dataRepository.getMagazine(id.toString());
      return Response.json(body: {'data': magazines});
      break;
  }
}
