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
    var clrOn = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 1)
    var clrOff = UIColor(hue: 0, saturation: 0, brightness: 100, alpha: 1)
    @IBAction func pickGood(_ sender: Any) {
        btnGood.setTitleColor(clrOn, for: UIButton.State.normal)
        btnOK.setTitleColor(clrOff, for: UIButton.State.normal)
        btnBad.setTitleColor(clrOff,for: UIButton.State.normal)
        btnBad.setTitle("", for: UIButton.State.normal)
        btnOK.setTitle("", for: UIButton.State.normal)
        btnGood.setTitle("Today was a good day!", for: UIButton.State.normal)
        selected = 0
        print("0")
    }
    @IBAction func pickOK(_ sender: Any) {
        btnGood.setTitleColor(clrOff, for: UIButton.State.normal)
        btnOK.setTitleColor(clrOn, for: UIButton.State.normal)
        btnBad.setTitleColor(clrOff,for: UIButton.State.normal)
        btnBad.setTitle("", for: UIButton.State.normal)
        btnOK.setTitle("Today was fine.", for: UIButton.State.normal)
        btnGood.setTitle("", for: UIButton.State.normal)
        selected = 1
        print("1")
    }
    @IBAction func pickBad(_ sender: Any) {
        btnGood.setTitleColor(clrOff, for: UIButton.State.normal)
        btnOK.setTitleColor(clrOff, for: UIButton.State.normal)
        btnBad.setTitleColor(clrOn,for: UIButton.State.normal)
        btnBad.setTitle("Today could have been better.", for: UIButton.State.normal)
        btnOK.setTitle("", for: UIButton.State.normal)
        btnGood.setTitle("", for: UIButton.State.normal)
        selected = 2
        print("2")
    }
    @IBAction func pickSUBMIT(_ sender: Any) {
        //This is the part where you run away
        //it also does nothing
    }
    override func prepare(for segue: UIStoryboardSegue,sender: (Any)?){
        if segue.identifier == "submit" {
            let destController = segue.destination as! NewController
            destController.moodValue = selected
        }
    }
}

