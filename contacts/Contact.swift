//
//  Contact.swift
//  contacts
//
//  Created by Yujia on 2021/12/8.
//

import Foundation

class Contact: NSObject, NSCoding {
    var title: String
    
    var isFav = false
    var isComplete = false
    
    func encode(with coder: NSCoder){
        coder.encode(title, forKey: "title")
        coder.encode(isFav, forKey: "isFav")
        coder.encode(isComplete, forKey: "isComplete")
    }

    required init?(coder: NSCoder){
        title = coder.decodeObject(forKey: "title") as! String
        isFav = coder.decodeBool(forKey: "isFav")
        isComplete = coder.decodeBool(forKey: "isComplete")

    }
    
    init(title:String) {
        self.title = title
    }
}
