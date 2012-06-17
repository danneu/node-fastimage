# FastImage for Node.js

Inspired by [sdsykes/fastimage](https://github.com/sdsykes/fastimage) (Ruby)

No need to download an entire image or depend on an image processing library
just to determine an image's `type`, `width`, and `height`.

FastImage analyzes the bytes of the first response chunk and then aborts the
request.

Works with image types: `gif`, `bmp`, `jpg`, `png`.

## Usage

~~~ javascript
img = new FastImage("http://example.com/2000x1200-image.png");
img.type   // "png"
img.width  // 2000
img.height // 1200
~~~

## References

* [PNG/GIF/BMP byte inspection](http://dzone.com/snippets/determine-image-size)
* [JPG byte inspection](http://pennysmalls.com/find-jpeg-dimensions-fast-in-pure-ruby-no-ima)
