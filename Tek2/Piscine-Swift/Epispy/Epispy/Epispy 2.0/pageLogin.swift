//
//  pageLogin.swift
//  Epispy 2.0
//
//  Created by Joseph Pereniguez on 25/04/2016.
//  Copyright © 2016 Joseph Pereniguez. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Alamofire
import BRYXBanner
import SlideMenuControllerSwift

class pageLogin: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    var user = userClass()
    
    @IBAction func loginApp(_ sender: UIButton) {
        APIManager.instanceShared.getLogin(txtUser.text!, password: txtPassword.text!) { (json) in
            if let _ = json["error"].dictionary {
                let banner = Banner(title: "Connection failed.", subtitle: "Wrong username or password.", image: UIImage(named: "Icon"), backgroundColor: UIColor(red:255.00/255.0, green:50.0/255.0, blue:50.0/255.0, alpha:1.000))
                banner.dismissesOnTap = true
                banner.show(duration: 3.0)
            }
            else {
                self.user.userLogin = self.txtUser.text
                self.user.userPassword = self.txtPassword.text
                print(self.user.userPassword)
                self.performSegue(withIdentifier: "segueLogin", sender: nil)
            }
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pageLogin.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLogin" {
            let loginView = segue.destination as! ViewController
            loginView.user = self.user
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
