class LaboratoryTestResult
        @@array = Array.new
        attr_accessor :code, :result, :formate, :comment
        
        def all_instances
            array_to_be_returned = @@array
            @@array = []
            array_to_be_returned
        end

        def initialize code,result,comment
            maped_hash = {"20" => 20.0, "NEGATIVE" => -1.0, "POSITIVE"=> -2.0, "NIL" => -1.0, "+" => -2.0, "++" => -2.0, "+++" => -3.0}
            format_hash = {"C200" => "float", "C100" => "float", "A250" => "boolean", "B250" => "nil_3plus"}
            @code = code
            @formate = format_hash[code]
            @comment = comment
            @result = maped_hash[result] ? maped_hash[result] : result
            @@array << self
        end
    end