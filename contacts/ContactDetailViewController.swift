//
//  ContactDetailViewController.swift
//  contacts
//
//  Created by Yujia on 2021/12/8.
//

import UIKit

class ContactDetailViewController: UIViewController {

    var contact: Contact!
    var contactList: ContactList!
    
    @IBOutlet weak var TextName: UILabel!
    
    @IBOutlet weak var TextPhone: UILabel!
    
    @IBAction func EditContact(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TextName.text = contact.title
        TextPhone.text = contact.phone

    }
    override func viewWillDisappear(_ animated: Bool) {
        contact.title = TextName.text!
        contact.phone = TextPhone.text!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dst3 = segue.destination as! ContactAddListViewController
        if(segue.identifier == "edit"){
      
            dst3.contact = contact
            dst3.contactList = contactList
        
    }
}
}
