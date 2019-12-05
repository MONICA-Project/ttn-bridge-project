FROM mcr.microsoft.com/dotnet/core/sdk:3.0

RUN mkdir /build
WORKDIR /build

COPY TTN-Bridge /build/TTN-Bridge

COPY Librarys/litjson /build/Librarys/litjson
COPY Librarys/mqtt /build/Librarys/mqtt

COPY Utils/Bot-Utils /build/Utils/Bot-Utils
COPY Utils/ConnectorDataMqtt /build/Utils/ConnectorDataMqtt
COPY Utils/Utils /build/Utils/Utils
COPY Utils/Utils-IoT /build/Utils/Utils-IoT

WORKDIR /build/TTN-Bridge
RUN dotnet build TTN-Bridge.sln --configuration Release

RUN mkdir /usr/local/bin/ttnbridge -p
RUN cp TTN-Bridge/bin/Release/netcoreapp3.0/*.dll /usr/local/bin/ttnbridge -r
RUN cp TTN-Bridge/bin/Release/netcoreapp3.0/*.runtimeconfig.json /usr/local/bin/ttnbridge -r

WORKDIR /usr/local/bin/ttnbridge
RUN rm -r /build

RUN mkdir /etc/ttnbridge -p