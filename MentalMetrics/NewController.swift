//
//  NewController.swift
//  MentalMetrics
//
//  Created by Daniel Revay on 4/17/21.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class NewController: UIViewController {
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnWebsite: UIButton!
    @IBOutlet weak var lblParagraph: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    var moodValue = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
    @IBAction func pickGoogle(_ sender: Any) {
    }
    @IBAction func pickWebsite(_ sender: Any) {
    }
}
