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
    //get UIbutton
    @IBOutlet weak var Avatar: UIImageView!
    
    @IBOutlet weak var TextName: UILabel!
    
    @IBOutlet weak var TextPhone: UILabel!
    
    @IBAction func EditContact(_ sender: Any) {

    }
    //set animation after loading
    override func viewDidLoad() {
        super.viewDidLoad()
        playAnimation()
        // Do any additional setup after loading the view.
    }
    //get list data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TextName.text = contact.title
        TextPhone.text = contact.phone

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        contact.title = TextName.text!
        contact.phone = TextPhone.text!
    }
    //set navigation for edit (add list view controller page)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dst3 = segue.destination as! ContactAddListViewController
        if(segue.identifier == "edit"){
      
            dst3.contact = contact
            dst3.contactList = contactList
        
    }
}
    //add animation for UIimageView
    func playAnimation()
    {
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat, .autoreverse],
                       animations: { [self] in
            self.Avatar.frame.origin.x = Avatar.frame.width - 370
        },
        completion: nil)
    }}
