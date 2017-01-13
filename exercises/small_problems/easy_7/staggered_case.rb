
def staggered_case(string)
  result = ''
  string.chars.each_with_index do |chr, index|
    if index.odd?
      result << chr.downcase
    else
      result << chr.upcase
    end
  end
  result
end

def staggered_case_ignore_non_alphabetic(string)
  result = ''
  upcase = false

  string.chars.each_with_index do |chr, index|
    if ('a'..'z').include?(chr.downcase)
      if upcase == true
        result << chr.downcase
      else
        result << chr.upcase
      end
      upcase = !upcase
    else
      result << chr
    end
  end
  result
end

p staggered_case_ignore_non_alphabetic('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case_ignore_non_alphabetic('ALL CAPS') #== 'AlL cApS'
p staggered_case_ignore_non_alphabetic('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'
