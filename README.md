# FastImage for Node.js

Inspired by [sdsykes/fastimage](https://github.com/sdsykes/fastimage) (Ruby)

No need to download an entire image or depend on an image processing library
just to determine an image's `type`, `width`, and `height`.

FastImage analyzes the bytes of the first response chunk and then aborts the
request.

Works with image types: `gif`, `bmp`, `jpg`, `png`.

## Usage

~~~ javascript
new FastImage("http://example.com/2000x1200-image.png", function(img) {
  img.type   // "png"
  img.width  // 2000
  img.height // 1200
});
~~~

## TODO

* The instantiation + callback API is pretty weird. Instead it should
  probably be something like:

        fastimage = require("fastimage")
        fastimage("http://example.com/2000x1200-image.png", function(img) {
          img.type
          img.width
          img.height
        });

* I haven't been able  to test the `else` condition on the BMP parser. I have
  yet to find a BMP that doesn't satisfy the `if` code path.

        parseSizeForBmp: (buffer) ->
          buf = buffer.slice 14, 28
          if buf[0] is 40
            width  = buf.readUInt32LE(4)
            height = buf.readUInt32LE(8)
            @callback null, {@type, width, height}
          else
            @callback "TODO: Unimplemented BMP case", null

* Need some real error handling.
* Better tests.
* Local file inspection.

## References

* [PNG/GIF/BMP byte inspection](http://dzone.com/snippets/determine-image-size)
* [JPG byte inspection](http://pennysmalls.com/find-jpeg-dimensions-fast-in-pure-ruby-no-ima)
