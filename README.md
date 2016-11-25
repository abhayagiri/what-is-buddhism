# What is Buddhism?

What is Buddhism offers a very clear and concise overview of Buddhism and its core teachings, and addresses many questions that people unfamiliar with or new to it's teachings often raise.

Document class based on [hark](https://github.com/profound-labs/hark) courtesy
of Tan Gambhiro.

## Requirements

### Debian/Ubuntu

```sh
apt-get install -y build-essential imagemagick pandoc texlive-full
```

### OS X

```sh
brew cask install mactex
brew install pandoc
brew install imagemagick --with-little-cms --with-little-cms2
```

See http://leftontheweb.com/blog/2015/02/25/Imagemagick_error_OSX/

### Cygwin

```cmd
apt-cyg install texlive
```

Install pandoc separately.

## Building

```sh
make
```
