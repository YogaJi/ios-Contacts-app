//
//  Contact.swift
//  contacts
//
//  Created by Yujia on 2021/12/8.
//

import Foundation

class Contact: NSObject, NSCoding {
    //set name and phone
    var title: String
    var phone: String

    func encode(with coder: NSCoder){
        coder.encode(title, forKey: "title")
        coder.encode(phone, forKey: "phone")

    }

    required init? (coder: NSCoder){
       
        title = coder.decodeObject(forKey: "title") as! String
        phone = (coder.decodeObject(forKey: "phone") as! String)

    }
    // set init
    init(title:String, phone: String) {
        self.title = title
        self.phone = phone

    }
    
    func setName(title: String){
        self.title = title
    }

}
