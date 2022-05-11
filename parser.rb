require './laboratorytestresult.rb'
class Parser
    @file
    def initialize file_path
        if File.exist?(file_path)
            @file = File.open(file_path)
        else
            @file = nil
        end
    end

    def mapped_results 
        tests = []
        comments = []
        objects_array = []
        return "File not Found" if @file.nil?
        @file.readlines.map(&:chomp).each do |line|
          current_line =  line.split('|')
          if current_line.include?("OBX")
            tests.push(current_line)
          elsif current_line.include?("NTE")
            comments.push(current_line) 
          end
        end
        return "No tests found" if tests.length == 0
        tests.each do |result|
            index =  result[1]
            ind_comments = ""
            ind_comments = comments.select{|x| x[1] == index}
            ind_comments = ind_comments.map{|x| x[2]}
            ind_comments = ind_comments.join("\n")
            lab_results = LaboratoryTestResult.new(result[2],result[3],ind_comments)
            objects_array.push(lab_results.all_instances)
        end
        return objects_array.inspect
    end
  end

  parse = Parser.new("result.txt") 
  puts parse.mapped_results