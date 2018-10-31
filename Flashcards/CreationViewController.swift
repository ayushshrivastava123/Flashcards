//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Ayush Shrivastava on 10/27/18.
//  Copyright © 2018 Ayush Shrivastava. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    var flashcardsController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var Question: UITextField!
    @IBOutlet weak var Answer: UITextField!
    
    
    
    @IBAction func didTopOnCancel(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText=Question.text
        let answerText=Answer.text
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        dismiss(animated:true)
        
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
