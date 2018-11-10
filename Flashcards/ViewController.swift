//
//  ViewController.swift
//  Flashcards
//
//  Created by Ayush Shrivastava on 10/13/18.
//  Copyright © 2018 Ayush Shrivastava. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var flashcards = [Flashcard] ()
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        readSavedFlashcards()
        
        if flashcards.count == 0{
        updateFlashcard(question:"What year was Buddha born?", answer:"623 BC")
        }
        else{
            updateLabels()
            UpdateNextPrevButtons()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTaponFlashcard(_ sender: Any) {
        
        if frontLabel.isHidden==true{
            frontLabel.isHidden=false
        }
        else{
            frontLabel.isHidden=true
        }
    
    }
    
    
    @IBAction func didTaponPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        
        updateLabels()
        
        UpdateNextPrevButtons()
        
    }
    
    
    @IBAction func didTaponNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        
        updateLabels()
        
        UpdateNextPrevButtons()
    }
    
    
    
    func updateFlashcard(question:String, answer:String) {
        
        let flashcard = Flashcard(question: question, answer: answer)
        
        frontLabel.text=flashcard.question
        backLabel.text=flashcard.answer
        
        flashcards.append(flashcard)
        print("Added new flashcard")
        
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count-1
        print("Our current idex is \(currentIndex)")
        
        UpdateNextPrevButtons()
        
        updateLabels()
        
        saveAllFlashcardsToDisk()
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    func UpdateNextPrevButtons() {
        
        if currentIndex == flashcards.count-1 {
         nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else {
            prevButton.isEnabled = true
        }
    }
    
    
    func saveAllFlashcardsToDisk() {
        //UserDefaults.standard.set(flashcards, forKey: "flashcards")
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer]
            
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
        
    }
    
    func readSavedFlashcards() {
       
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            let savedCards = dictionaryArray.map{
                dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController=segue.destination as! UINavigationController
        let creationController=navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController=self
    }
    
    
    
    
}

