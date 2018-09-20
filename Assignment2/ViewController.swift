//
//  ViewController.swift
//  Assignment2
//
//  Created by Rhythm Mecwan on 9/20/18.
//  Copyright © 2018 Rhythm Mecwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redNumber: UITextField!
    @IBOutlet weak var greenNumber: UITextField!
    @IBOutlet weak var blueNumber: UITextField!
    
    @IBAction func colorButton(_ sender: Any) {
        if (redNumber.text == "") {
            redNumber.text = "0"
        }
        if (greenNumber.text == "") {
            greenNumber.text = "0"
        }
        if (blueNumber.text == "") {
            blueNumber.text = "0"
        }
        let redInt: Int? = Int(redNumber.text!)
        let greenInt: Int? = Int(greenNumber.text!)
        let blueInt: Int? = Int(blueNumber.text!)
        
        //colorView.backgroundColor = UIColor(red: CGFloat(redInt!/100), green: CGFloat(greenInt!/100), blue: CGFloat(blueInt!/100), alpha: 0.8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

