import 'dart:io';

import 'package:dart_grpc_example/generated/lib/protos/image.pbgrpc.dart';
import 'package:grpc/grpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 8888,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  final stub = ImageServiceClient(channel);

  try {
    final image = await File('bin/example.jpg').readAsBytes();

    final response = await stub.resizeImage(
      ImagePayload(payload: image),
      options: CallOptions(compression: const GzipCodec()),
    );

    await File('bin/resized_example.jpg').writeAsBytes(response.payload);
  } catch (e) {
    print('Error: $e');
  }

  await channel.shutdown();
}
