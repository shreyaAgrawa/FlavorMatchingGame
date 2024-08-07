//
//  QuestionViewController.swift
//  FlavorMatchingGame
//
//  Created by Shreya Agrawal on 5/5/22.
//

import UIKit

    class QuestionViewController: UIViewController {
        @IBOutlet weak var AC1: UIButton!
        @IBOutlet weak var AC2: UIButton!
        @IBOutlet weak var AC3: UIButton!
        @IBOutlet weak var AC4: UIButton!
        @IBOutlet weak var Image: UIImageView!
        @IBOutlet weak var Next: UIButton!
        var numRight = 0
        var model = QuizModel()
        var category = "Indian"
        var numQuestions = 4
        var quiz: [Trivia] = [Trivia]()
        @IBOutlet weak var ProgressBar: UIProgressView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //ProgressBar.progress = 0.0
            AC1.layer.cornerRadius = AC1.bounds.size.height/2
            AC2.layer.cornerRadius = AC2.bounds.size.height/2
            AC3.layer.cornerRadius = AC3.bounds.size.height/2
            AC4.layer.cornerRadius = AC4.bounds.size.height/2
            //quiz = model.makeQuiz(category: category, quantity: numQuestions)
            //updateView()
            // Do any additional setup after loading the view.
        }
        
        override func viewWillAppear(_ animated: Bool) {
            ProgressBar.progress = 0.0
            quiz = model.makeQuiz(category: category, quantity: numQuestions)
            AC1.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
            print("turn purple in vWA")
            AC2.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
            AC3.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
            AC4.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
            updateView()
        }
        
        @IBAction func OneClicked(_ sender: Any) {
            
            if (AC1.currentTitle == quiz[0].correct)
            {
                numRight = numRight + 1
            }
            print("clickedOneGoingToSetColor")
            setColor()
            
        }
        
        @IBAction func TwoClicked(_ sender: Any) {
            
            if (AC2.currentTitle == quiz[0].correct)
            {
                numRight = numRight + 1
            }
            print("clickedTwoGoingToSetColor")
            setColor()
        }
        
        @IBAction func ThreeClicked(_ sender: Any) {
            if (AC3.currentTitle == quiz[0].correct)
            {
                numRight = numRight + 1
            }
            print("clickedThreeGoingToSetColor")
            setColor()
        }
        
        @IBAction func FourClicked(_ sender: Any) {
            print("clickedFour")
            if (AC4.currentTitle == quiz[0].correct)
            {
                numRight = numRight + 1
            }
            print("clickedFourGoingToSetColor")
            setColor()
        }
        
        @IBAction func NextButton(_ sender: Any) {
            print("NextButton")
            loadAndDisplayQuestion()
        }
        
        func setColor()
        {
            if (AC1.currentTitle == quiz[0].correct)
            {
                AC1.backgroundColor = UIColor.green
                AC2.backgroundColor = UIColor.red
                AC3.backgroundColor = UIColor.red
                AC4.backgroundColor = UIColor.red
                print("setColorOne")

            }
            if (AC2.currentTitle == quiz[0].correct)
            {
                
                AC2.backgroundColor = UIColor.green
                AC1.backgroundColor = UIColor.red
                AC3.backgroundColor = UIColor.red
                AC4.backgroundColor = UIColor.red
                print("setColorTwo")
            }
            if (AC3.currentTitle == quiz[0].correct)
            {
                AC3.backgroundColor = UIColor.green
                AC1.backgroundColor = UIColor.red
                AC2.backgroundColor = UIColor.red
                AC4.backgroundColor = UIColor.red
                print("setColorThree")
            }
            if (AC4.currentTitle == quiz[0].correct)
            {
                AC4.backgroundColor = UIColor.green
                AC2.backgroundColor = UIColor.red
                AC3.backgroundColor = UIColor.red
                AC1.backgroundColor = UIColor.red
                print("setColorFour")
            }
        }
        
        
        
        func updateView()
        {
            ProgressBar.progress = Float((numQuestions - quiz.count))/Float(numQuestions)
            Image.image = UIImage(named: quiz[0].imageFileName)
            var answers: [String] = [String]()
            answers.append(quiz[0].correct)
            var incorrectAnswers = quiz[0].incorrect
            for answer in incorrectAnswers {
                answers.append(answer)
            }
            answers.shuffle()
            
            AC1.setTitle(answers[0], for: .normal)
            AC2.setTitle(answers[1], for: .normal)
            AC3.setTitle(answers[2], for: .normal)
            AC4.setTitle(answers[3], for: .normal)
            print("updateViewCalled")
            
        }
        
        func loadAndDisplayQuestion()
        {
            quiz.removeFirst()
            if (quiz.count > 0)
            {
                AC1.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
                AC2.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
                AC3.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
                AC4.backgroundColor = UIColor (red: 54.0/255.0, green: 1.0/255.0, blue: 63.0/255.0, alpha: 1)
                print("lADQ")
                updateView()
            }
            else
            {
                performSegue(withIdentifier: "GoToResults", sender: nil)
            }
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.results = "\(numRight) out of \(numQuestions)!"
        }
        
        @IBAction func unwindToSecond(segue: UIStoryboardSegue)
        {
            print("unwinded")
            print(self.tabBarController!.selectedIndex)
            self.tabBarController!.selectedIndex = 0
        
        }
        
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }




