class FileWriter

    WriteSentences: (data) ->
        out  = "7.0.1.14930\n"
        out += "linux:Linux3.13.0-35-generic\n" # you can put almost anything on this line
        out += "SntF\n"
        out += "C#{Math.round (new Date).getTime() / 1000}D#{Math.round (new Date).getTime() / 1000}\n"
        out += "S#{@Checksum out}\n"
        out += "#{data.length}\n"
        out += "#{ln}\f" for ln in data
        out += "\n" if data.length isnt 0
        out += "s=#{@Checksum out};\n"

    Checksum: (str) ->
        val = 0
        s = 0
        for ch in str
            if ch isnt "\n" and ch isnt "\r"
                b = ch.charCodeAt 0
                val += (b << s ^ b >> 7 & 0x1 ^ 0xFFFFFFFF) & 0xFF
                val &= 0xFFFF;
                s = (s + 1) % 8
        val


window.FileWriter = FileWriter
