//
//  AdviceTableViewController.swift
//  GirlTalkApp!!
//
//  Created by wlac on 7/15/20.
//  Copyright © 2020 Zoe Howes. All rights reserved.
//

import UIKit

class AdviceTableViewController: UITableViewController {
    
    var questions : [AdviceColumnCD] = []
    
 
        func getQuestions() {
                 if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                   
                   if let coreDataQuestions = try? context.fetch(AdviceColumnCD.fetchRequest()) as? [AdviceColumnCD] {
                       questions = coreDataQuestions
                       
                       tableView.reloadData()

      }
    }
    /*func askQuestions() -> [AdviceColumn] {

      let relationshipFake = AdviceColumn()
      relationshipFake.name = "A question about relationships"
      relationshipFake.anonymous = false

      let schoolFake = AdviceColumn()
      schoolFake.name = "A question about school"
      // important is set to false by default

        return [relationshipFake, schoolFake]*/
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let question = questions[indexPath.row]
        
        if let name = question.name {
            if question.anonymous {
                cell.textLabel?.text = "Anonymous:" + name
            
        } else {
          cell.textLabel?.text = question.name
        }
        }
        return cell

        // Configure the cell...

        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let question = questions[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: question)
    }

    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? askQuestionViewController {
          addVC.previousVC = self
        }
        if let completeVC = segue.destination as? AnswerViewController {
          if let question = sender as? AdviceColumnCD {
            completeVC.selectedAdviceColumn = question
            completeVC.previousVC = self
          }
        }
    

}
}


