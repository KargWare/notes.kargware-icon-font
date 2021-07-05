# notes.kargware-icon-font

Generate a font (eot, ttf, woff, woff2) based on SVGs which are used on the blog [notes.kargware.com](https://notes.kargware.com)

The preview of the font can be seen as [GitHub Page](http://kargware.github.io/notes.kargware-icon-font/).

## Build the Font

All `*.svg` files from source folder `./svgs` will be collected and a font `Notes-KargWare Icon-Font` will be created inside the target folder `./dist/fonts`.

### Build the Font locally

```shell
make create-folders
make install-font-generator
make collect-svgs
make generate-font
make show-font-demo
```

### Build the Font with docker

### Build the Font on GitHub

To build the 

### Build the Font on GitLab
