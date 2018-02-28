require_relative 'quiz'

module Score
    module_function
    # user_score variable

    def checker(content, question_index_that_was_asked, answer)
        if answer == content[question_index_that_was_asked][:answer]
            puts "You are correct" 
        else
            puts "Wrong"
        end
    end
end
