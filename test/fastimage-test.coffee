assert = require "assert"
log = console.log
FastImage = require "../src/fastimage"

remoteJpg = "http://upload.wikimedia.org/wikipedia/commons/9/9d/243_Ida_large.jpg"
remoteBmp = "http://www.mikeboncaldo.com/photos/hiker.bmp"
remoteGif = "http://i573.photobucket.com/albums/ss172/klikmuda/screenshot40-large.gif"
remotePng = "http://outreach.jach.hawaii.edu/pressroom/2004_wfcam/orion-zoom-large.png"

describe "FastImage", ->
  describe "jpg", ->
    it "parses correct dimensions", (done) ->
      new FastImage remoteJpg, (err, img) ->
        assert.equal img.type, "jpg"
        assert.equal img.width, 1973
        assert.equal img.height, 1229
        done()
  describe "bmp", ->
    it "parses correct dimensions", (done) ->
      new FastImage remoteBmp, (err, img) ->
        assert.equal img.type, "bmp"
        assert.equal img.width, 1148
        assert.equal img.height, 1713
        done()
  describe "gif", ->
    it "parses correct dimensions", (done) ->
      new FastImage remoteGif, (err, img) ->
        assert.equal img.type, "gif"
        assert.equal img.width, 1024
        assert.equal img.height, 768
        done()
  describe "png", ->
    it "parses correct dimensions", (done) ->
      new FastImage remotePng, (err, img) ->
        assert.equal img.type, "png"
        assert.equal img.width, 1280
        assert.equal img.height, 1280
        done()



