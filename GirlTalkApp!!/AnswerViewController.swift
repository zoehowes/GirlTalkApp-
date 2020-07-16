//
//  AnswerViewController.swift
//  GirlTalkApp!!
//
//  Created by wlac on 7/16/20.
//  Copyright © 2020 Zoe Howes. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var previousVC = AdviceTableViewController()
    var selectedAdviceColumn : AdviceColumnCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedAdviceColumn?.name
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func replyTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
          if let theQuestion = selectedAdviceColumn {
            context.delete(theQuestion)
            navigationController?.popViewController(animated: true)
          }
        }
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
