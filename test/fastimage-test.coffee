assert = require "assert"
log = console.log
fastimage = require "../src/fastimage"

remoteJpg = "http://upload.wikimedia.org/wikipedia/commons/9/9d/243_Ida_large.jpg"
remoteBmp = "http://www.mikeboncaldo.com/photos/hiker.bmp"
remoteGif = "http://i573.photobucket.com/albums/ss172/klikmuda/screenshot40-large.gif"
remotePng = "http://outreach.jach.hawaii.edu/pressroom/2004_wfcam/orion-zoom-large.png"

describe "FastImage", ->
  describe "jpg", ->
    it "parses correct dimensions", (done) ->
      fastimage remoteJpg, (err, dimensions) ->
        assert.equal dimensions.type, "jpg"
        assert.equal dimensions.width, 1973
        assert.equal dimensions.height, 1229
        done()
  describe "bmp", ->
    it "parses correct dimensions", (done) ->
      fastimage remoteBmp, (err, dimensions) ->
        assert.equal dimensions.type, "bmp"
        assert.equal dimensions.width, 1148
        assert.equal dimensions.height, 1713
        done()
  describe "gif", ->
    it "parses correct dimensions", (done) ->
      fastimage remoteGif, (err, dimensions) ->
        assert.equal dimensions.type, "gif"
        assert.equal dimensions.width, 1024
        assert.equal dimensions.height, 768
        done()
  describe "png", ->
    it "parses correct dimensions", (done) ->
      fastimage remotePng, (err, dimensions) ->
        assert.equal dimensions.type, "png"
        assert.equal dimensions.width, 1280
        assert.equal dimensions.height, 1280
        done()



