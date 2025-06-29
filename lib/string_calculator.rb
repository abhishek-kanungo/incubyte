class StringCalculator
    
    def add(string)
        numbers_array = parse_string_numbers(string)
        detect_negatives(numbers_array).sum
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
    
    def detect_negatives(numbers_array)
        negatives = numbers_array.select(&:negative?)
        
        return numbers_array if negatives.empty?
        
        raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end
end