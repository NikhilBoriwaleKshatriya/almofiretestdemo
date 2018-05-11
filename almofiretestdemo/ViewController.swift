//
//  ViewController.swift
//  almofiretestdemo
//
//  Created by nikhil boriwale on 3/5/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var mytable: UITableView!
    var MyResponse : JSON = nil
    var users : [User] = []
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as! usercell
        let myuser = self.users[indexPath.row]
        
        cell.name.text = myuser.name
        cell.username.text = myuser.username
        cell.email.text = myuser.email
        cell.phone.text = myuser.phone
        cell.companyname.text = myuser.compnay.companyName
        cell.companypharse.text = myuser.compnay.pharse
        cell.address.text = myuser.address.street
      
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string:"https://jsonplaceholder.typicode.com/users")
        var request  =  URLRequest (url:url! as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        Alamofire.request(request as! URLRequestConvertible).responseJSON{ response in
            
            switch response.result{
            case .success(let data):
                print("Successfully grabbed response",data)
                //convert data into JSOn & Store into Myrespnse Key
                self.MyResponse = JSON(data)
                for i in 0..<self.MyResponse.count{
                    let singleuser = User(userJson:self.MyResponse[i])
                    self.users.append(singleuser)
                }
                self.mytable.reloadData()
            case .failure(let error):
                print("request failed with error\(error)")
                }
            }
    }
}


