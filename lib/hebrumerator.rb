#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module Hebrumerator
  MAX = 1000 ** 3

  GERESH       = "\u05F3".encode('utf-8')
  GERSHAYIM    = "\u05F4".encode('utf-8')
  HAMISHA_ASAR = 'טו'
  SHISHA_ASAR  = 'טז'

  @numeral_map = {
    1   => 'א',
    2   => 'ב',
    3   => 'ג',
    4   => 'ד',
    5   => 'ה',
    6   => 'ו',
    7   => 'ז',
    8   => 'ח',
    9   => 'ט',
    10  => 'י',
    20  => 'כ',
    30  => 'ל',
    40  => 'מ',
    50  => 'נ',
    60  => 'ס',
    70  => 'ע',
    80  => 'פ',
    90  => 'צ',
    100 => 'ק',
    200 => 'ר',
    300 => 'ש',
    400 => 'ת',
    500 => 'תר',
    600 => 'תר',
    700	=> 'תש',
    800 => 'תת',
    900 => 'תתק'
  }

  def self.to_hebrew num
    raise "Bigger than #{MAX}: #{num}" if num > MAX
    segments = []
    [ 2, 1, 0 ].each do |exp|
      power = 1000 ** exp
      if num >= power
        factor = (num/power).to_i
        segments << hebrew_segment(factor, '', @numeral_map.keys)
        num -= (power*factor)
      end
    end
    hebrew = segments.join()
    case hebrew.size
    when 1
      hebrew += GERESH
    else
      hebrew.insert(-2, GERSHAYIM)
    end
    hebrew
  end

  def self.hebrew_segment num, hebrew, digit_list
    digit = digit_list.last
    # puts "%4d - %s - %s", num, hebrew, digit_list.join(',')
    case num
    when 0
      hebrew
    when 15
      hebrew += HAMISHA_ASAR
    when 16
      hebrew += SHISHA_ASAR
    else
      if num >= digit
        num -= digit
        hebrew += @numeral_map[digit]
      end
      digit_list.pop if digit >= num
      hebrew_segment num, hebrew, digit_list
    end
  end

  def self.to_arabic hebrew
    s = hebrew.gsub(/[#{GERSHAYIM}#{GERESH}]/,'')
    num = 0
    last_c = nil
    s.each_char do |c|
      last_c ||= c
      if last_c >= c
        num += @numeral_map.key c
      else
        num *= 1000
        num += @numeral_map.key c
      end
      last_c = c
    end
    num
  end
end
