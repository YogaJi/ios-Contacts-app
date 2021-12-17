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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
//        cell.detailTextLabel?.attributedText = NSAttributedString(string: contact.phone)
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
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        contactList.moveContact(fromIndexPath: fromIndexPath, toIndexPath: to)
    }
    
//    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath){
//        //don't highlight
//    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        if contactList.list[indexPath.section][indexPath.row].isComplete{
//            contactList.list[indexPath.section][indexPath.row].isComplete = false
//            //move back to normal section
//            contactList.moveToNormal(fromIndexPath: indexPath)
//        }else{
//            contactList.list[indexPath.section][indexPath.row].isComplete = true
//            //move to completed sections
//            contactList.moveToCompleted(fromIndexPath: indexPath)
//        }

        tableView.reloadData()
    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
//
//        var header: String?
//
//        switch section {
//            case 0:
//                header = "Favourites"
//            case 1:
//                header = "Contacts"
//            case 2:
//                header = "Completed"
//            default:
//                header = nil
//            }
//        if contactList.list[section].count == 0{
//            header = nil
//        }
//            return header
//
//    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    //     In a storyboard-based application, you will often want to do a little preparation before navigation
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //         Get the new view controller using segue.destination.
    //         Pass the selected object to the new view controller.
            let dst = segue.destination as? ContactAddListViewController
            
            if(segue.identifier == "add"){
//                let contact = Contact(title:"")
                let contact = contactList.addContact(title: "", phone: "")
            dst?.contact = contact
            dst?.contactList = contactList
            }
            let dst2 = segue.destination as? ContactDetailViewController
            
            if(segue.identifier == "show"){
                if  let indexPath = tableView.indexPathForSelectedRow {
                    let contact = contactList.list[indexPath.section][indexPath.row]
                    dst2?.contact = contact
                    dst2?.contactList = contactList
                }
            }
            
//            switch segue.identifier{
//            case "show":
//                if  let indexPath = tableView.indexPathForSelectedRow {
//                    let contact = contactList.list[indexPath.section][indexPath.row]
//                    dst.contact = contact
//                    dst.contactList = contactList
//                }
////            case "edit":
////                if  let indexPath = tableView.indexPathForSelectedRow {
////                    let contact = contactList.list[indexPath.section][indexPath.row]
////                    dst.contact = contact
////                    dst.contactList = contactList
////                }
//            case "add":
////                let contact = Contact(title:"")
//                let contact = contactList.addContact(title: "")
//                dst.contact = contact
//                dst.contactList = contactList
//            default:
//                preconditionFailure("Segue Identifier did not exist")
//            }

        }
    

}

