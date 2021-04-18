//
//  ViewController.swift
//  MentalMetrics
//
//  Created by Daniel Revay on 4/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnGood: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var btnBad: UIButton!
    @IBOutlet weak var btnSUBMIT: UIButton!
    var selected = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pickGood(_ sender: Any) {
        btnBad.titleLabel?.text = ""
        btnOK.titleLabel?.text = ""
        btnGood.titleLabel?.text = "Today was a good day!"
        selected = 0
    }
    @IBAction func pickOK(_ sender: Any) {
        btnBad.titleLabel?.text = ""
        btnOK.titleLabel?.text = "Today was fine."
        btnGood.titleLabel?.text = ""
        selected = 1
    }
    @IBAction func pickBad(_ sender: Any) {
        btnBad.titleLabel?.text = "Today could have been better."
        btnOK.titleLabel?.text = ""
        btnGood.titleLabel?.text = ""
        selected = 2
    }
    @IBAction func pickSUBMIT(_ sender: Any) {
        //This is the part where you run away
    }
    
}

