## Example gRPC service to resize images & deployed to Google Cloud Run

### generate dart source files from proto

```shell
protoc --dart_out=grpc:lib/generated lib/protos/*
```

### build docker container

```shell
docker build -t dart-grpc-example-server .
```

### run docker container

```shell
docker run -it --rm -p 8080:8080 --name myserver dart-grpc-example-server
```


