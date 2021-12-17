//
//  Contact.swift
//  contacts
//
//  Created by Yujia on 2021/12/8.
//

import Foundation

class Contact: NSObject, NSCoding {
    var title: String
    var phone: String

    func encode(with coder: NSCoder){
        coder.encode(title, forKey: "title")
        coder.encode(phone, forKey: "phone")

    }

    required init? (coder: NSCoder){
       
        title = coder.decodeObject(forKey: "title") as! String

        phone = (coder.decodeObject(forKey: "phone") as! String)
//        phone = (coder.decodeObject(forKey: "phone") as! Int)

    }
    
    init(title:String, phone: String) {
        self.title = title
        self.phone = phone

    }
    
    func setName(title: String){
        self.title = title
    }
    
//    func setPhone(phones: Int?){
//        phone = phones
//    }
}
