# Env-fduthesis

**Env-fduthesis** provides a customizable docker image for compiling latex source files with [fduthesis](https://github.com/stone-zeng/fduthesis) package for **docker users on Mac and Linux**. **Env-fduthesis is a time and space-saving choice compared to other local compilation solutions.**

### Install and usage

Pull this repository to local, run build.sh to build the docker image. 

Configure and run compile.sh to compile your latex source file.

Configure resources/packages-to-add and run add_packages.sh to add latex packages to and re-export the image.

### Features

The installed latex packages of this image mainly include the installation list of [TinyTex](https://yihui.org/tinytex/), as well as other packages for compiling test examples of fduthesis. As a result, the installation time and disk usage would not exceed that of tex-small and other common texlive distributions.

Windows system is not supported because the author does not have a windows device for testing at this time :)

### Contribution

Any contribution is welcome! Feel free to make comments, issues and send pull requests.