FROM mono:latest

RUN mkdir /build
WORKDIR /build

COPY Utils/Bot-Utils /build/Utils/Bot-Utils
COPY Utils/ConnectorDataMqtt /build/Utils/ConnectorDataMqtt
COPY Librarys/litjson /build/Librarys/litjson
COPY Librarys/mqtt /build/Librarys/mqtt
COPY Librarys/Mono.Posix /build/Librarys/Mono.Posix
COPY Utils/Utils /build/Utils/Utils
COPY Utils/Utils-IoT /build/Utils/Utils-IoT

COPY TTN-Bridge /build/TTN-Bridge

RUN mkdir Builds
RUN msbuild /p:Configuration="Release" /p:Platform="Any CPU" /p:OutputPath="./bin/Release/" "TTN-Bridge/TTN-Bridge.sln"

RUN mkdir /usr/local/bin/ttnbridge -p
RUN cp TTN-Bridge/TTN-Bridge/bin/Release/*.dll /usr/local/bin/ttnbridge -r
RUN cp TTN-Bridge/TTN-Bridge/bin/Release/*.exe /usr/local/bin/ttnbridge -r

RUN mkdir /etc/ttnbridge -p

WORKDIR /usr/local/bin/ttnbridge
