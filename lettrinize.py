import sys

LETTRINE_OPTIONS = {
    'A': 'nindent=3pt',
    'B': 'nindent=1pt',
    'F': 'nindent=-3pt',
    'M': 'nindent=1pt',
    'T': 'nindent=-3pt',
}

in_path = sys.argv[1]
out_path = sys.argv[2]

last_line_is_section = False
last_line_is_blank = False

with open(in_path) as in_file:
    with open(out_path, 'w') as out_file:
        for line in in_file.readlines():
            line = line.strip()
            if line == '':
                last_line_is_blank = True
                pass
            elif line[:9] == '\\section{':
                last_line_is_section = True
                last_line_is_blank = False
            elif last_line_is_section and last_line_is_blank:
                ch = line[0]
                options = LETTRINE_OPTIONS.get(ch, '')
                line = '\lettrine[%s]{%s}%s' % (options, ch, line[1:])
                last_line_is_section = False
                last_line_is_blank = False
            out_file.write(line + '\n')
