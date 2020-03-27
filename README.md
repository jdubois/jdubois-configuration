# Julien Dubois's configuration

This script installs basic tools, Java and NodeJS on a normal Ubuntu box.

## Quickstart

The script should be run as root, and it can be downloaded and executed with one command, using cURL:

```bash
sudo su
sh -c "$(curl -fsSL https://raw.githubusercontent.com/jdubois/jdubois-configuration/master/install.sh)"
```

__Warning__ As this script will update the system, it will trigger a system reboot at the end

## What is being installed

- Basic system utilities like Git or Vim
- Java : latest long term support JDK release from [AdoptOpenJDK](https://adoptopenjdk.net/)
- NodeJS : latest long term support NodeJS release from [NodeSource](https://nodesource.com/)
- Automatic updates

## License

You are free to use this script under the [Apache 2 license](LICENSE.txt).
