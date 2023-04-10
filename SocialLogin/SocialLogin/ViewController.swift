//
//  ViewController.swift
//  SocialLogin
//
//  Created by MAC OS 17 on 26/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    var SocialNames = ["Facebook", "Google Sign-in", "Apple Sign-in"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableView.register(UINib(nibName: "SocialCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SocialNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SocialCell {
            cell.lblSocialNames.text = SocialNames[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (SocialNames[indexPath.row] == "Facebook") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FacebookVC") as! FacebookVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
       else if (SocialNames[indexPath.row] == "Google Sign-in") {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "GoogleLoginVC") as! GoogleLoginVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
        else if (SocialNames[indexPath.row] == "Apple Sign-in") {
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     let vc = storyboard.instantiateViewController(withIdentifier: "AppleLoginVC") as! AppleLoginVC
                     self.navigationController?.pushViewController(vc, animated: true)
    } 
}
}
