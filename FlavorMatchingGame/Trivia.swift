//
//  Trivia.swift
//  FlavorMatchingGame
//
//  Created by Shreya Agrawal on 5/5/22.
//

import Foundation
struct Trivia
{
    var imageFileName: String
    var correct: String
    var incorrect: [String]
    init (_ iFN: String, _ correct: String, _ incorrect: [String])
    {
        imageFileName = iFN
        self.correct = correct
        self.incorrect = incorrect
    }
}

class QuizModel
{
    var questionBanks: [String: [Trivia]]
    var categories : [String]
    init()
    {
        questionBanks = ["Indian" : [Trivia("Samosa", "Samosa", ["Pakora", "Papdi", "Brinjal"]), Trivia("GarlicNaan", "Garlic Naan", ["Roti", "Paratha", "Khakra"]), Trivia("MalaiKofta", "Malai Kofta", ["Shahi Paneer", "Spinach Kofta", "Curry"]), Trivia("AlooChaat", "Aloo Chaat", ["Samosa Chaat", "Papdi Chaat", "Dahi Chaat"])]]
        categories = ["Indian"]
    }
    
    func makeQuiz(category: String, quantity: Int) -> [Trivia]
    {
        if var quiz = questionBanks[category]
        {
            quiz.shuffle()
            quiz = quiz.dropLast(quiz.count - quantity)
            return quiz
        }
        else
        {
            return [Trivia]()
        }
    }
    
    func getNumberOfCategories() -> Int
    {
        return categories.count
    }
    
    func getNumberOfQuestions(forCategory: String) -> Int
    {
        if let quiz = questionBanks[forCategory] {
            return quiz.count
        }
        else
        {
            return -1
        }
    }
}
