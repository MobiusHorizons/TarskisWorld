// Generated by CoffeeScript 1.4.0
(function() {
  var FileWriter;

  FileWriter = (function() {

    function FileWriter() {}

    FileWriter.prototype.WriteSentences = function(data) {
      var ln, out, _i, _len;
      out = "7.0.1.14930\n";
      out += "linux:Linux3.13.0-35-generic\n";
      out += "SntF\n";
      out += "C" + (Math.round((new Date).getTime() / 1000)) + "D" + (Math.round((new Date).getTime() / 1000)) + "\n";
      out += "S" + (this.Checksum(out)) + "\n";
      out += "" + data.length + "\n";
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        ln = data[_i];
        out += "" + ln + "\f";
      }
      if (data.length !== 0) {
        out += "\n";
      }
      return out += "s=" + (this.Checksum(out)) + ";\n";
    };

    FileWriter.prototype.Checksum = function(str) {
      var b, ch, s, val, _i, _len;
      val = 0;
      s = 0;
      for (_i = 0, _len = str.length; _i < _len; _i++) {
        ch = str[_i];
        if (ch !== "\n" && ch !== "\r") {
          b = ch.charCodeAt(0);
          val += (b << s ^ b >> 7 & 0x1 ^ 0xFFFFFFFF) & 0xFF;
          val &= 0xFFFF;
          s = (s + 1) % 8;
        }
      }
      return val;
    };

    return FileWriter;

  })();

  window.FileWriter = FileWriter;

}).call(this);
