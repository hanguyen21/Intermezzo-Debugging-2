require "string_repeater"

RSpec.describe StringRepeater do
 it "repeat a tring many times" do 
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(io).to receive(:puts).with("Please enter a string")
    expect(io).to receive(:gets).and_return("ha")
    expect(io).to receive(:puts).with("Please enter a number of repeats")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("hahaha")
    string_repeater = StringRepeater.new(io)
    string_repeater.run

 end
end