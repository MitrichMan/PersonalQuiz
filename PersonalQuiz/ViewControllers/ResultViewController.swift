//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
     
    @IBOutlet var resultImageLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let resultAnimal = getMostOftenAnimalType()
        resultImageLabel.text = "Вы - \(resultAnimal?.rawValue ?? "🐙")"
        resultDescriptionLabel.text = resultAnimal?.definition ?? "Вы осьминог!"
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: - method, which gets most picked animal and returns it.
private extension ResultViewController {
    
    func getMostOftenAnimalType() -> Animal? {
        var animalsCount: [Animal: Int] = [:]
        
        answers.forEach { answer in
            animalsCount[answer.animal] = (animalsCount[answer.animal] ?? 0) + 1
        }
        return animalsCount.max { $0.value < $1.value}?.key
    }
}
