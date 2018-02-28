require 'rainbow'
require 'terminal-table'
require_relative 'quiz'
require_relative 'score'

module Quanda
    module_function
    def ask(content)
        random_ques_index = 0
        random_ques_index = rand(0..(content.length - 1))
        # show question
        puts content[random_ques_index][:question]
        if content[random_ques_index][:kind] == "single response"
            random_ques_index
        elsif content[random_ques_index][:kind] == "mult-choice response"
            puts "Choose from these options:"
            puts "\t" + content[random_ques_index][:choices].join(", ")
            random_ques_index
        else
            puts "under construction building new question kinds"
        end
    end

    def run(content)
        puts Quiz.welcome

        answer = ""
        while answer != "q"
            # show question
            question_index_that_was_asked = self.ask(content)
            # user response
            puts "Please enter your answer?"
            answer = gets.chomp
            Score.checker(content, question_index_that_was_asked, answer)
        end
        puts "cya next time"
    end
end

content = [
    { kind: "single response", question: 'What dog breed is this?', answer: 'doggo', score: 0 },
    { kind: "single response", question: "What's your age", answer: 'answer1', answer_2: 'answer 2', score: 0 },
    { kind: "single response", question: "What's your name?", answer: '', score: 0},
    { 
        kind: "mult-choice response", 
        question: "How many legs does a dog have?",
        choices: ["3", "4"], 
        answer: "4", 
        score: 0
    }
]

Quanda.run(content)





       