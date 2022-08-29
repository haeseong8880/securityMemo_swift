//
//  SecurityViewController.swift
//  securityMemo
//
//  Created by haeseongJung on 2022/08/28.
//

import UIKit

class SecurityViewController: UIViewController {
    
    var password: String = ""
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    
    @IBOutlet weak var numberPadSeven: UIButton!
    @IBOutlet weak var numberPadEight: UIButton!
    @IBOutlet weak var numberPadNine: UIButton!
    @IBOutlet weak var numberPadFour: UIButton!
    @IBOutlet weak var numberPadFive: UIButton!
    @IBOutlet weak var numberPadSix: UIButton!
    @IBOutlet weak var numberPadOne: UIButton!
    @IBOutlet weak var numberPadTwo: UIButton!
    @IBOutlet weak var numberPadThree: UIButton!
    @IBOutlet weak var numberPadZero: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        oneLabel.text = "-"
        twoLabel.text = "-"
        threeLabel.text = "-"
        fourLabel.text = "-"
        password = ""
    }
    
    @IBAction func numberPadButtonTapped(_ sender: UIButton) {
        if sender.tag == 10 {
            oneLabel.text = "-"
            twoLabel.text = "-"
            threeLabel.text = "-"
            fourLabel.text = "-"
            password = ""
        } else {
            if password.count == 0 {
                oneLabel.text = "*"
                password = "\(sender.tag)"
            } else if password.count == 1 {
                twoLabel.text = "*"
                password = "\(password)\(sender.tag)"
            } else if password.count == 2 {
                threeLabel.text = "*"
                password = "\(password)\(sender.tag)"
            } else if password.count == 3 {
                fourLabel.text = "*"
                password = "\(password)\(sender.tag)"
            }
        }
        if password.count == 4 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
