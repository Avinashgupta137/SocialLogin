//
//  AppleLoginVC.swift
//  SocialLogin
//
//  Created by MAC OS 17 on 27/04/22.
//

import UIKit
import AuthenticationServices
import Firebase
import FirebaseOAuthUI


class AppleLoginVC: UIViewController, FUIAuthDelegate{

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
//    func setupProviderLoginView() {
//        let authorizationButton = ASAuthorizationAppleIDButton()
//        authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
//        self.loginProviderStackView.addArrangedSubview(authorizationButton)
//
//
//    }
//    @objc
//    func handleAuthorizationAppleIDButtonPress() {
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let request = appleIDProvider.createRequest()
//        request.requestedScopes = [.fullName, .email]
//
//        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
//        authorizationController.performRequests()
//    }
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.view.window!
//    }
    @IBAction func loginButtonTapped(_ sender: Any) {

        if let authUI = FUIAuth.defaultAuthUI() {
            authUI.providers = [FUIOAuth.appleAuthProvider()]

            authUI.delegate = self

            let authViewController = authUI.authViewController()
            self.present(authViewController, animated: true)

    }

    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let user = authDataResult?.user {
            print("Nice you are signup\(user.uid). your their email")


        }
    }
}
