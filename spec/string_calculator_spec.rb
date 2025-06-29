require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
    
    subject(:calculator) { StringCalculator.new }

    
    describe "add" do
        it "returns 0 when input is an empty string" do
            expect(calculator.add("")).to eq(0)
        end
    end
end