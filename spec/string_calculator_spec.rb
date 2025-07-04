require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
    
    subject(:calculator) { StringCalculator.new }
    
    describe "add" do
        context "when given an empty string" do
            it "returns 0 when input is an empty string" do
                expect(calculator.add("")).to eq(0)
            end
        end
        
        context "when given a single number as a string" do
            it "returns the same number as integer" do
                expect(calculator.add('5')).to eq(5)
            end
        end
        
        context "when given two comma separated numbers as string" do
            it "returns their sum as integer" do
                expect(calculator.add('5,10')).to eq(15)
            end
        end
        
        context "when givem muptiple comma separated numbers as string" do
            it "returns their sum as integer" do
                expect(calculator.add('5,10,20,100')).to eq(135)
            end
        end
        
        context "when given two newline separated numbers as string" do
            it "returns their sum as integer" do
                expect(calculator.add("5\n10")).to eq(15)
            end
        end
        
        context "when given multiple numbers separated by combination of newline and comma as string" do
            it "returns their sum as integer" do
                expect(calculator.add("5\n10,50")).to eq(65)
            end
        end
        
        context "custom delimeter" do
            context "when single character delimeter is passed" do
                it "uses custom delimeter to split the string and return sum as integer" do
                    expect(calculator.add("//;\n1;2")).to eq(3)
                end
            end
            
             context "when multi character delimeter is passed" do
                it "uses custom delimeter to split the string and return sum as integer" do
                    expect(calculator.add("//[***]\n1***2***3")).to eq(6)
                end
            end
        end
        
        context "when the input contains a single negative number" do
            it "raises with that negative in the message" do
                expect { calculator.add("1,-2,3") }.to raise_error(ArgumentError, "negative numbers not allowed -2")
            end
        end

        context "when the input contains multiple negatives" do
            it "lists all negatives in the exception message" do
                expect { calculator.add("-1,-2\n3,-4") }.to raise_error(ArgumentError, "negative numbers not allowed -1,-2,-4")
            end
        end
        
        context "when numbers greater than 1000 are present in input string" do
            it "ignores them in the sum" do
                expect(calculator.add("//;\n1001;2;3")).to eq(5)
            end
        end
    end
end