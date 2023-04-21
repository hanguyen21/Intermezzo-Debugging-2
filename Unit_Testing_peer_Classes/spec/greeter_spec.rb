require "greeter"

RSpec.describe Greeter do
 it "asks the user name and say hello" do 
   io = double :io
   expect(io).to receive(:puts).with("What is your name?")
   expect(io).to receive(:gets).and_return("ha")
   expect(io).to receive(:puts).with("Hello, ha")
   greeter = Greeter.new(io)
   greeter.greet
 end
end