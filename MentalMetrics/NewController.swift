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
        print(moodValue)
        if moodValue == 0 {
            lblParagraph.text = "Great! Have a wonderful day!"
            imgImageView.image = UIImage(named: "273-Freedom_1")
        }
        if moodValue == 1 {
            lblParagraph.text = "Keep your eyes peeled for good things in life."
            imgImageView.image = UIImage(named: "225-Healing")
        }
        if moodValue == 2 {
            lblParagraph.text = "There's nothing wrong with having a down day."
            imgImageView.image = UIImage(named: "263-Cuddling-A-Cat")
        }
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.moodValue = moodValue
    }
    @IBAction func pickGoogle(_ sender: Any) {
    }
    @IBAction func pickWebsite(_ sender: Any) {
    }
}
