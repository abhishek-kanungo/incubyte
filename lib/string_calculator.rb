class StringCalculator
    
    def add input
       parse_string_numbers(input).sum
    end
    
    
    private
    
    def parse_string_numbers(string)
        return [] if string.empty?
        
        string.split(/,|\n/).map(&:to_i)
    end
end