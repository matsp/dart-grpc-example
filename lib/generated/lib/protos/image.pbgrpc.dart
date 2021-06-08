///
//  Generated code. Do not modify.
//  source: lib/protos/image.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'image.pb.dart' as $0;
export 'image.pb.dart';

class ImageServiceClient extends $grpc.Client {
  static final _$resizeImage =
      $grpc.ClientMethod<$0.ImagePayload, $0.ImagePayload>(
          '/ImageService/ResizeImage',
          ($0.ImagePayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ImagePayload.fromBuffer(value));

  ImageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ImagePayload> resizeImage($0.ImagePayload request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resizeImage, request, options: options);
  }
}

abstract class ImageServiceBase extends $grpc.Service {
  $core.String get $name => 'ImageService';

  ImageServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ImagePayload, $0.ImagePayload>(
        'ResizeImage',
        resizeImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ImagePayload.fromBuffer(value),
        ($0.ImagePayload value) => value.writeToBuffer()));
  }

  $async.Future<$0.ImagePayload> resizeImage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ImagePayload> request) async {
    return resizeImage(call, await request);
  }

  $async.Future<$0.ImagePayload> resizeImage(
      $grpc.ServiceCall call, $0.ImagePayload request);
}
