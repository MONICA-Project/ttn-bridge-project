# Monica TTN-Bridge Project
<!-- Short description of the project. -->

Project that contains the TTN-Bridge and all its dependencies. This readme is meant for describing the application with all dependencies, see `Deployment` if you want to work with.

<!-- A teaser figure may be added here. It is best to keep the figure small (<500KB) and in the same repo -->

## Getting Started
<!-- Instruction to make the project up and running. -->

The project documentation is available on the [Wiki](https://github.com/MONICA-Project/ttn-bridge/wiki) of ttn-bridge.

## Deployment
<!-- Deployment/Installation instructions. If this is software library, change this section to "Usage" and give usage examples -->

### Checkout
Please checkout this project with it submodules:
```bash
git clone https://github.com/MONICA-Project/ttn-bridge-project
bash update.sh 
```

### Docker
To run the latest version of TTN-Bridge, [Checkout this repo](#Checkout) and then run:
```bash
docker-compose build
mkdir ./config
docker-compose up
```
Edit the `settings.conf` maybe.

## Development
<!-- Developer instructions. -->

### Build

This depends on the OS you running.

#### Windows

[Checkout this repo](#Checkout) and open `TTN-Bridge/TTN-Bridge.sln` in Visual Studio. Then run Debug or Release.

On Windows you can create with `TTN-Bridge/TTN-Bridge/dpkg/create-Builds.bat` deb files for Linux, if you have WSL installed

#### Linux

[Checkout this repo](#Checkout) and run: `msbuild /p:Configuration="Release" /p:Platform="Any CPU" /p:OutputPath="./bin/Release/" "TTN-Bridge/TTN-Bridge.sln"`

You must have `mono-complete` and `libmono-posix4.0-cil` installed

If you want to have deb files run `cd TTN-Bridge/TTN-Bridge/dpkg` and `bash make-deb.sh armhf` that you can install with `sudo dpkg -i armhf-ttnbridge_x.x-x.deb`

### Prerequisite

On Windows you need C# Runtime 4.7.2, on linux you need Mono, installation instructions are available [here](https://www.mono-project.com/download/stable/#download-lin-debian). You need only setup apt.

If you install the deb packets, it will check and install all dependencies.

## Contributing
Contributions are welcome. 

Please fork, make your changes, and submit a pull request. For major changes, please open an issue first and discuss it with the other authors.

## Affiliation
![MONICA](https://github.com/MONICA-Project/template/raw/master/monica.png)  
This work is supported by the European Commission through the [MONICA H2020 PROJECT](https://www.monica-project.eu) under grant agreement No 732350.