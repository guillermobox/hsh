def col(string, fmtcolor):
    """ col(string,colorfmt) -> colored_string
    
    This function returns the given string but colorized as the user specifies
    at 'colorfmt'. The key for this string is:
    
        colorfmt == '[modifier][fgcolor][bgcolor]'

    Being both optional but almost one needed, and there are no order.

        modifier = {+-i} where 
                         + stands for highlight 
                         - stands for dimmed
                         i reverses the video

        fgcolor = {rgbymckw} where each letter stands for a color
        bgcolor = {RGBYMVKW} where each letter stands for a color

    Example:
        print col('this is blue','b')
    """
    if len(fmtcolor)==0:
      return None

    table = {
      '+':'1',
      '-':'2',
      'i':'7',
      'k':'30',
      'r':'31',
      'g':'32',
      'y':'33',
      'b':'34',
      'm':'35',
      'c':'36',
      'w':'37',
      'K':'40',
      'R':'41',
      'G':'42',
      'Y':'43',
      'B':'44',
      'M':'45',
      'C':'46',
      'W':'47' }

    start = '\033['
    end   = '\033[0m'
    code  = []

    for letter in fmtcolor:
      if table.has_key(letter):
        code.append( table[letter] )

    start = start + ';'.join(code) + 'm'

    return start + string + end
