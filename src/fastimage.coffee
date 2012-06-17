http = require "http"
log = console.log
{parse} = require "url"

class FastImage

  @fastimage: (uri, callback) ->
    new FastImage(uri, callback).fetchDimensions()

  constructor: (@uri, @callback) ->

  fetchDimensions: -> 
    @fetchPacket @uri

  fetchPacket: (uri) ->
    {host, path} = parse uri
    req = http.get {host, path, port: 80}, (res) =>
      res.on "data", (buffer) =>
        @parseSize buffer
        req.abort()

  parseSize: (buffer) ->
    @type = @parseType buffer
    switch @type
      when "gif" then @parseSizeForGif buffer
      when "bmp" then @parseSizeForBmp buffer
      when "png" then @parseSizeForPng buffer
      when "jpg" then @parseSizeForJpg buffer

  parseType: (buffer) ->
    switch buffer.slice(0, 2).toString "hex"
      when "4749" then "gif"
      when "424d" then "bmp"
      when "8950" then "png"
      when "ffd8" then "jpg"
      else throw "Unrecognized type"

  parseSizeForGif: (buffer) -> 
    width  = buffer.readInt16LE 6
    height = buffer.readInt16LE 8
    @callback null, {@type, width, height}

  parseSizeForBmp: (buffer) ->
    buf = buffer.slice 14, 28
    if buf[0] is 40
      width  = buf.readUInt32LE(4)
      height = buf.readUInt32LE(8)
      @callback null, {@type, width, height}
    else
      @callback "TODO: Unimplemented BMP case", null
      #log buf[4..8].readUInt32BE 0

  parseSizeForPng: (buffer) ->
    width = buffer.readUInt32BE(16)
    height = buffer.readUInt32BE(20)
    @callback null, {@type, width, height}

  parseSizeForJpg: (buffer) -> 
    state = 0
    width = null
    height = null
    for byte in buffer
      state = switch state
        when 0
          if byte is 255 then 1 else 0
        when 1
          if byte >= 192 and byte <= 195 then 2 else 0
        when 2 then 3
        when 3 then 4
        when 4 then 5
        when 5
          height = byte * 256
          6
        when 6
          height += byte
          7
        when 7
          width = byte * 256
          8
        when 8
          width += byte
          break
    @callback null, {@type, width, height}

module.exports = FastImage.fastimage
