//
//  AddToDoViewController.swift
//  toDoList
//
//  Created by J M on 8/2/22.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var ImportantSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var previousVC = ToDoTableViewController()
    
    @IBAction func addPressed(_ sender: Any) {
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            print("going")
          // we are creating a new ToDoCD object here, naming it toDo
                            
        
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = ImportantSwitch.isOn
           
        print(context)
        }
//    previousVC.toDos.append(toDo)
//        previousVC.tableView.reloadData()
//         navigationController?.popViewController(animated: true)

            navigationController?.popViewController(animated: true)

            try? context.save()

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
}
