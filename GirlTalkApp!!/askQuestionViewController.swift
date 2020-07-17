//
//  askQuestionViewController.swift
//  GirlTalkApp!!
//
//  Created by Mia Elizabeth Alvarado on 7/16/20.
//  Copyright © 2020 Zoe Howes. All rights reserved.
//

import UIKit

class askQuestionViewController: UIViewController {
    
    var previousVC = AdviceTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var anonymousSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func postTapped(_ sender: Any) {
    // we have to grab this view context to be able to work with Core Data
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        // we are creating a new ToDoCD object here, naming it toDo
        let question = AdviceColumnCD(entity: AdviceColumnCD.entity(), insertInto: context)

        // if the titleTextField has text, we will call that text titleText
        if let titleText = titleTextField.text {
            // we will take the titleText and assign that value to toDo.name
            // this .name and .important came from the attributes you typed in on the Core Data page!
            question.name = titleText
            question.anonymous = anonymousSwitch.isOn
            print (question.name)
        }

        try? context.save()

        navigationController?.popViewController(animated: true)
      }

    }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


