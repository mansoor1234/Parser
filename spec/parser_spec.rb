require './parser.rb'
describe Parser do
    describe "#result_data" do
        it "return if there are no test available" do
            parse = Parser.new("./result_test.txt")
            expect(parse.mapped_results).to eq "No tests found"
        end
        it "return if there are no file available" do
            parse = Parser.new("./results.txt")
            expect(parse.mapped_results).to eq "File not Found"
        end
    end
end