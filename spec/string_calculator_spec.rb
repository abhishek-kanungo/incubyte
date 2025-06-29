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
        
    end
end