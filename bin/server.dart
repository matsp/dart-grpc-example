import 'package:dart_grpc_example/generated/lib/protos/image.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/src/server/call.dart';
import 'package:image/image.dart';

class ImageService extends ImageServiceBase {
  @override
  Future<ImagePayload> resizeImage(
      ServiceCall call, ImagePayload request) async {
    final image = decodeImage(request.payload);
    final resizedImage = copyResize(image!, width: 120);

    return ImagePayload(payload: encodeJpg(resizedImage, quality: 80));
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [ImageService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 8888);
}
