//
//  FacebookVC.swift
//  SocialLogin
//
//  Created by MAC OS 17 on 26/04/22.
//
import UIKit
import FBSDKLoginKit

// Add this to the body
class FacebookVC: UIViewController {
   
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        lblId.isHidden = true
        lblName.isHidden = true
        lblEmail.isHidden = true
        updateButton(isLoggedIn: (AccessToken.current != nil))
        updateMessage(with: Profile.current?.name)
       
    }
}
extension FacebookVC {
    
    private func updateButton(isLoggedIn: Bool) {
        let title = isLoggedIn ? "Log out 👋🏻" : "Log in 👍🏻"
        loginButton.setTitle(title, for: .normal)
        guard AccessToken.current != nil else { return }

        let request = GraphRequest(graphPath: "me", parameters: ["fields":"first_name,last_name, id, email, name, picture.width(480).height(480)"])
        request.start() { connection, result, error in
            if let result = result, error == nil {
                print("fetched user: \(result)")
            }
                guard let json = result as? NSDictionary else { return }
            if let id = json["id"] as? String {
             print("\(id)")
                self.lblId.text = id
            }
               if let Email = json["email"] as? String {
                print("\(Email)")
                   self.lblEmail.text = Email
               }
               if let firstName = json["first_name"] as? String {
//                self.lblFirstName.text = firstName
                print("\(firstName)")
                   
            }
            if let lastName = json["last_name"] as? String {
                print("\(lastName)")
            }
            if let Name = json["name"] as? String {
                print("\(Name)")
                self.lblName.text = Name
            }
            
        }
     
    }
    @IBAction func btn(_ sender: Any) {
        let loginManager = LoginManager()
        if let _ = AccessToken.current {
            // Access token available -- user already logged in
            // Perform log out
            loginManager.logOut()
            
            updateButton(isLoggedIn: false)
            updateMessage(with: nil)
            
        } else {
            loginManager.logIn(permissions: [], from: self) { [weak self] (result, error) in
                guard error == nil else {
                    // Error occurred
                    print(error!.localizedDescription)
                    return
                }
                guard let result = result, !result.isCancelled else {
                    print("User cancelled login")
                    return
                }
                
                self?.updateButton(isLoggedIn: true)
                Profile.loadCurrentProfile { (profile, error) in
                    self?.updateMessage(with: Profile.current?.name)
                    
                    
                }
            }
        }
    }
    
    private func updateMessage(with name: String?) {
        guard let name = name else {
            lbl.text = "Please log in with Facebook."
            lblId.isHidden = true
            lblName.isHidden = true
            lblEmail.isHidden = true
            return
        }
        
        // User already logged in
        lbl.text = "Hello, \(name)!"
        lblId.isHidden = false
        lblName.isHidden = false
        lblEmail.isHidden = false
    }
}
