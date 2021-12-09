//
//  TodoDetailController.swift
//  contacts
//
//  Created by Yujia on 2021/12/9.
//

import UIKit

class ContactDetailController: UIViewController {
    var contact: Contact!
    var contactList: ContactList!
    
//    @IBOutlet weak var Labeltitle: UILabel!
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBAction func saveTodoList(_ sender: Any) {
//        contactList.saveList()
//    }
    
    @IBOutlet weak var contactName: UILabel!
    
    @IBOutlet weak var contactPhone: UILabel!
    //    override func viewDidLoad() {
//        super.viewDidLoad()
    @IBAction func editButton(_ sender: Any) {
      
    }
    
    @IBAction func deleteButton(_ sender: Any) {
//        contactList.deleteList()
    }
    //
//        // Do any additional setup after loading the view.
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//       textField.text = contact.title
//
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        contact.title = textField.text!
//    }
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        let dst = segue.destination as! ContactAddListViewController
        
        switch segue.identifier{
        case "edit":

                dst.contact = contact
                dst.contactList = contactList
         

        default:
            preconditionFailure("Segue Identifier did not exist")
        }

    }
}
