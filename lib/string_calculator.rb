class StringCalculator
    
    def add(string)
       parse_string_numbers(string).sum
    end
    
    
    private
    
    def parse_string_numbers(string)
        return [] if string.empty?
        
        delimeter, number_string = extract_delimeter(string)
        
        number_string.split(delimeter).map(&:to_i)
    end
    
    def extract_delimeter(string)
        delimeters = [",", "\n"] 
        
        if string.start_with?("//")
            delimeter, number_string = string.split("\n", 2)
            return [Regexp.new(delimeter[2..-1]), number_string]
        else
            return[Regexp.new(",|\n"), string]
        end
    end
end