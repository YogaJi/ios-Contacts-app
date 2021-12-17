//
//  ContactTableViewController.swift
//  contacts
//
//  Created by Yujia on 2021/12/8.
//
import UIKit
class ContactTableViewController: UITableViewController {
    
    var contactList: ContactList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //load data
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contactList.list.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.list[section].count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)

        // Configure the cell...
        let contact = contactList.list[indexPath.section][indexPath.row]
        cell.textLabel?.attributedText = NSAttributedString(string: contact.title)
        cell.detailTextLabel?.attributedText = NSAttributedString(string: contact.phone)
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            contactList.deleteContact(indexPath: indexPath)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.reloadData()
    }


    // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //         Get the new view controller using segue.destination.
    //         Pass the selected object to the new view controller.
            let dst = segue.destination as? ContactAddListViewController
            //set navigation add
            if(segue.identifier == "add"){
                let contact = contactList.addContact(title: "", phone: "")
            dst?.contact = contact
            dst?.contactList = contactList
            }
            let dst2 = segue.destination as? ContactDetailViewController
            //set navigation show list
            if(segue.identifier == "show"){
                if  let indexPath = tableView.indexPathForSelectedRow {
                    let contact = contactList.list[indexPath.section][indexPath.row]
                    dst2?.contact = contact
                    dst2?.contactList = contactList
                }
            }
            

        }
    

}

