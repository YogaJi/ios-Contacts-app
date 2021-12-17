//
//  ContactList.swift
//  contacts
//
//  Created by Yujia on 2021/12/8.
//

import Foundation
import CoreImage

class ContactList {
    
    var contactURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //get the document:
        var documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("contact20.archive")
    }()
    
    var list = [[Contact]]()


    init(){
        //set-up sections
        print(contactURL)
//        
        list.append([])
        list.append([])
        list.append([])
        
        do{
            let data = try Data(contentsOf: contactURL)
            list = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [[Contact]]
        }catch let e {
            print(e.localizedDescription)
        }
    }
    
    func saveList(){
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: list, requiringSecureCoding: false)
            try data.write(to:contactURL)
        } catch let err{
            fatalError(err.localizedDescription)
        }
    }
    
    
    func deleteContact(indexPath: IndexPath){
        list[indexPath.section].remove(at: indexPath.row)
//        list.remove(at: indexPath.row)
    }
    
    @discardableResult func addContact(title: String, phone: String)-> Contact {
        let contact = Contact(title: title, phone: phone)
        list[1].insert(contact, at: 0)

        return contact
    }

    
    func moveContact(fromIndexPath: IndexPath, toIndexPath: IndexPath){
        let tmp = list[fromIndexPath.section][fromIndexPath.row]
        list[fromIndexPath.section].remove(at: fromIndexPath.row)
        list[fromIndexPath.section].insert(tmp, at: toIndexPath.row)
    }
    func moveToCompleted(fromIndexPath: IndexPath){
        let tmp = list[fromIndexPath.section][fromIndexPath.row]
        list[fromIndexPath.section].remove(at: fromIndexPath.row)
        
        list[2].append(tmp)
    }
    
    func moveToNormal(fromIndexPath: IndexPath){
        let tmp = list[fromIndexPath.section][fromIndexPath.row]
        list[fromIndexPath.section].remove(at: fromIndexPath.row)
        
        list[1].append(tmp)
    }
}
