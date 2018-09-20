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
    
    
    @IBOutlet weak var colorView: UIView!
    
    
    @IBAction func colorButton(_ sender: Any?) {
        
        self.view.endEditing(true)
        
        if (redNumber.text == "") {
            redNumber.text = "0"
        }
        if (greenNumber.text == "") {
            greenNumber.text = "0"
        }
        if (blueNumber.text == "") {
            blueNumber.text = "0"
        }
        
        UserDefaults.standard.set(redNumber.text, forKey: "red")
        UserDefaults.standard.set(greenNumber.text, forKey: "green")
        UserDefaults.standard.set(blueNumber.text, forKey: "blue")
        let red = redNumber.text
        let green = greenNumber.text
        let blue = blueNumber.text
        
        let redInt: Int? = Int(red!)
        let greenInt: Int? = Int(green!)
        let blueInt: Int? = Int(blue!)
        
        
        colorView.backgroundColor = UIColor(red: CGFloat(redInt!)/100.0, green: CGFloat(greenInt!)/100.0, blue: CGFloat(blueInt!)/100.0, alpha: 1.0) // Ask Professor Whitney if the color changes are appropriate
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>? /* the optional is for when color button is pressed */, with event: UIEvent? /* the optional is for when color button is pressed */) {
        self.view.endEditing(true) // close the keyboard if outside the text field is touched
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "red") as? String
        {
            redNumber.text = x
        }
        if let y = UserDefaults.standard.object(forKey: "green") as? String
        {
            greenNumber.text = y
        }
        if let z = UserDefaults.standard.object(forKey: "blue") as? String
        {
            blueNumber.text = z
        }
        self.colorButton(nil)
    }


}

