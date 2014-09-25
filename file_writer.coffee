class FileWriter

    WriteSentences: (data) ->
        # to follow actual format, store last header instead of a random one
        header = "C" + (Math.round (new Date).getTime() / 1000 - 1000 * Math.random())
        out  = "7.0.1.14930\n"
        out += "linux:Linux3.13.0-35-generic\n" # you can put almost anything on this line
        out += "SntF\n"
        out += "#{header}D#{Math.round (new Date).getTime() / 1000}\n"
        out += "S#{@Checksum out}\n"
        out += "#{data.length}\n"
        out += "#{ln}\f" for ln in data
        out += "\n" if data.length isnt 0
        out += "s=#{@Checksum out};\n"

    WriteWorld: (data) ->
        # sample data
        data = (null for col in [0...8] for row in [0...8])
        data[0][2] = {shape: "dodec", size: "large", label: ["a", "c"]}

        # enumerate world
        objs = []
        objs.push {pos: "#{col} #{row}", dat: cell} for cell, col in rowAr when cell isnt null for rowAr, row in data

        shapes = {tetr:  1, cube:   2, dodec: 3}
        sizes  = {small: 1, medium: 2, large: 3}
        header = "C" + (Math.round (new Date).getTime() / 1000 - 1000 * Math.random())

        out  = "7.0.1.14930\n"
        out += "linux:Linux3.13.0-35-generic\n"
        out += "WldF\n"
        out += "#{header}D#{Math.round (new Date).getTime() / 1000}\n"
        out += "S#{@Checksum out}\n"
        out += "#{objs.length}\n"
        for entry in objs
            out += "#{shapes[entry.dat.shape]} #{sizes[entry.dat.size]}\n"
            out += "#{entry.pos}\n'"
            out += ch for ch in entry.dat.label
            out += "\n"
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
