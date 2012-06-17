// Generated by CoffeeScript 1.3.1
(function() {
  var FastImage, assert, remoteJpg;

  assert = require("assert");

  FastImage = require("../src/fastimage");

  remoteJpg = "http://upload.wikimedia.org/wikipedia/commons/9/9d/243_Ida_large.jpg";

  new FastImage(remoteJpg, function(err, img) {
    if (err) {
      throw err;
    }
    assert.equal(img.type, "jpg");
    assert.equal(img.width, 1973);
    return assert.equal(img.height, 1229);
  });

}).call(this);
