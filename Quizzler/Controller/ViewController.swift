//
//  ViewController.swift
//  Quizzler
//
//  Created by Aditya Virbhadra Vyavahare on 08/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionTextView: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var flaseButton: UIButton!
    @IBOutlet weak var scoreView: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }

    @IBAction func userResponded(_ sender: UIButton) {
        //Answer check
        if quizBrain.checkAnswer(sender.title(for: .normal)!) == true {
            sender.alpha = 0.5
            sender.backgroundColor = UIColor.green
            //take up delay of the background color
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  sender.alpha = 1.0
                sender.backgroundColor = UIColor.clear
              }
        } else {
            sender.alpha = 0.5
            sender.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  sender.alpha = 1.0
                sender.backgroundColor = UIColor.clear
              }
        }
        
        //Next question
        updateQuestion()
    }
    
    func updateQuestion() {
        questionTextView.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        scoreView.text = "Score: \(quizBrain.getScore())"
    }
}
