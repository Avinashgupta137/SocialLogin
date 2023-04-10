//
//  GoogleLoginVC.swift
//  SocialLogin
//
//  Created by MAC OS 17 on 27/04/22.
//

import UIKit
import GoogleSignIn

class GoogleLoginVC: UIViewController {
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    let signInConfig = GIDConfiguration.init(clientID: "1048859285167-30cb5crcqasmeq4uod9bb58v85o52adi.apps.googleusercontent.com")
        
        var userGoogleEmail : String = ""
        var userGoogleName : String = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            btnLogout.isHidden = true
            lblName.isHidden = true
            lblEmail.isHidden = true
        }
        
    //MARK: - Navigation
    @IBAction func btnSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        self.btnLogin.isHidden = false
        self.btnLogout.isHidden = true
        lblName.isHidden = true
        lblEmail.isHidden = true
    }
    @IBAction func signIN(_ sender: Any) {
            GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
                guard error == nil else { return }
                self.btnLogin.isHidden = true
                self.btnLogout.isHidden = false
                self.lblName.isHidden = false
                self.lblEmail.isHidden = false
                guard let user = user else { return }
                let emailAddress = user.profile?.email
                let userGoogleEmail = user.profile?.email
                let fullName = user.profile?.name
                let userGoogleName = user.profile?.name
                let givenName = user.profile?.givenName
                let familyName = user.profile?.familyName
                let profilePicUrl = user.profile?.imageURL(withDimension: 320)
                self.lblName.text = emailAddress!
                self.lblEmail.text = fullName
                print(emailAddress!)
                print(fullName!)
                print(userGoogleName!)
                print(profilePicUrl!)
                print(userGoogleEmail!)
                print(givenName!)
                print(familyName!)
            }

        }

}
