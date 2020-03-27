# Julien Dubois's configuration

This script installs all the tools I like on top of a normal Ubuntu box.

## Quickstart

This script should be run via cURL:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/jdubois/jdubois-configuration/master/install.sh)"
```

Or via wget:

```bash
sh -c "$(wget -qO- https://raw.githubusercontent.com/jdubois/jdubois-configuration/master/install.sh)"
```

## What is being installed

- Basic system utilities like Git or Vim
- Java : latest long term support JDK release from [AdoptOpenJDK](https://adoptopenjdk.net/)
- NodeJS : latest long term support NodeJS release from [NodeSource](https://nodesource.com/)

## License

You are free to use this script under the [Apache 2 license](LICENSE.txt).
