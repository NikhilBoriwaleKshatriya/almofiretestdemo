//
//  userSwift.swift
//  almofiretestdemo
//
//  Created by nikhil boriwale on 3/5/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import Foundation
import SwiftyJSON
class User
{
    var name = String()
    var username = String()
    var email = String()
    var phone = String()
    var address = userAddres(addressJson: ["address"])
    var compnay = userCompany(companyJSON:["company"])
    init(userJson : JSON) {
        self.name = userJson["name"].stringValue
        self.username = userJson["username"].stringValue
        self.email = userJson["email"].stringValue
        self.phone = userJson["phone"].stringValue
        self.address = userAddres(addressJson:userJson["address"])
        self.compnay = userCompany(companyJSON: userJson["company"])
        
        
    }

    
}
class userAddres{
    var street = String()
    var suite = String()
    var city = String()
    init(addressJson: JSON) {
        self.street = addressJson["street"].stringValue
        self.suite = addressJson["suite"].stringValue
        self.city = addressJson["city"].stringValue
    }
    
}
class  userCompany {
    var companyName = String()
    var  pharse = String()
    init(companyJSON :JSON) {
         self.companyName = companyJSON["name"].stringValue
         self.pharse = companyJSON["catchPhrase"].stringValue
        
    }
}
