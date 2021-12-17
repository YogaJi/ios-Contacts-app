//
//  ContactAddListViewController.swift
//  contacts
//
//  Created by Yujia on 2021/12/8.
//

import Foundation
import UIKit

class ContactAddListViewController: UIViewController {

    var contact: Contact!
    var contactList: ContactList!
    
    @IBOutlet weak var InputTextName: UITextField!
    
//    @IBOutlet weak var InputTextPhone: UITextField!
    
    @IBOutlet weak var InputTextPhone: UITextField!
    
    @IBAction func DeleteButton(_ sender: UIButton) {
       
        self.InputTextName.text = ""
        self.InputTextPhone.text = ""
    }
    
    @IBAction func SaveContactList(_ sender: Any) {
        contactList.saveList()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        InputTextName.text = contact.title
        InputTextPhone.text = contact.phone
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        contact.title = InputTextName.text!
        contact.phone = InputTextPhone.text!

    }
      
}
