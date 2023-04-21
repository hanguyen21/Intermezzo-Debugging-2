require "calculator"

RSpec.describe InteractiveCalculator do
 it "returns the results of the subtraction" do 
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("6")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("6 - 3 = 3")
    interactive_calculator = InteractiveCalculator.new(io)
    interactive_calculator.run

 end
end