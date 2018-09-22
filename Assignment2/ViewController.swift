//  ViewController.swift
//  Assignment2
//  CS646, Professor Whitney
//  Created by Rhythm Mecwan on 9/20/18.
//  Red ID: 819209255
//  Copyright © 2018 Rhythm Mecwan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    
    /*
     * IBOutlets for the three textfields that represent red, blue, and green
     */
    @IBOutlet weak var redNumber: UITextField!
    @IBOutlet weak var greenNumber: UITextField!
    @IBOutlet weak var blueNumber: UITextField!
    
    /*
     * IBOutlet for the UIView
     */
    @IBOutlet weak var colorView: UIView!
    
    /*
     * IBOutlet to move the UIView
     */
    @IBOutlet var moveView: UIPanGestureRecognizer!
    
    /*
     * IBOutlet for the sliders
     */
    @IBOutlet weak var redSl: UISlider!
    @IBOutlet weak var greenSl: UISlider!
    @IBOutlet weak var blueSl: UISlider!
    
    /*
     *  Action functions so that the text fields match the slider
     */
    @IBAction func redSlider(_ sender: UISlider) {
        redNumber.text = String(Int(sender.value))
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        greenNumber.text = String(Int(sender.value))
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        blueNumber.text = String(Int(sender.value))
    }
    
    /*
     *  Action functions so the slider matches the text fields
     */
    @IBAction func redField(_ sender: Any) {
        let red = redNumber.text
        let redInt: Double? = Double(red!)
        redSl.setValue(Float(redInt!), animated: true)
    }
    
    @IBAction func greenField(_ sender: Any) {
        let green = greenNumber.text
        let greenInt: Double? = Double(green!)
        greenSl.setValue(Float(greenInt!), animated: true)
    }
    
    @IBAction func blueField(_ sender: Any) {
        let blue = blueNumber.text
        let blueInt: Double? = Double(blue!)
        blueSl.setValue(Float(blueInt!), animated: true)
    }
    
    /*
     * Action for the color button to change the UIView when it is pressed based
     * on the values inside of the text fields
     */
    @IBAction func colorButton(_ sender: Any?) {
        self.view.endEditing(true)
        
        // Handles nil edge case
        if (redNumber.text == "") {
            redNumber.text = "0"
        }
        
        if (greenNumber.text == "") {
            greenNumber.text = "0"
        }
        
        if (blueNumber.text == "") {
            blueNumber.text = "0"
        }
        // Saves the text fields so their values can be present even after killing the application
        UserDefaults.standard.set(redNumber.text, forKey: "red")
        UserDefaults.standard.set(greenNumber.text, forKey: "green")
        UserDefaults.standard.set(blueNumber.text, forKey: "blue")
        
        // Extracting the values from the text fields
        let red = redNumber.text
        let green = greenNumber.text
        let blue = blueNumber.text
        let redInt: Double? = Double(red!)
        let greenInt: Double? = Double(green!)
        let blueInt: Double? = Double(blue!)
        
        // This changes the UIView's color itself
        colorView.backgroundColor = UIColor(red: CGFloat(redInt!)/100.0, green: CGFloat(greenInt!)/100.0, blue: CGFloat(blueInt!)/100.0, alpha: 1.0)
    }
    
    /*
     * This drags the UIView when touched around
     */
    @IBAction func movedView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: colorView)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    /*
     * This places the center of the UIView under the the finger when the user
     * touches outside of the view
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self.view)
            colorView.center = CGPoint(x: location.x, y: location.y)
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        // Saves so the position of the sliders stay present after killing the application
        if let x = UserDefaults.standard.object(forKey: "red") as? String {
            redNumber.text = x
            let red = redNumber.text
            let redInt: Double? = Double(red!)
            redSl.setValue(Float(redInt!), animated: true)
        }
        if let y = UserDefaults.standard.object(forKey: "green") as? String {
            greenNumber.text = y
            let green = greenNumber.text
            let greenInt: Double? = Double(green!)
            greenSl.setValue(Float(greenInt!), animated: true)
        }
        if let z = UserDefaults.standard.object(forKey: "blue") as? String{
            blueNumber.text = z
            let blue = blueNumber.text
            let blueInt: Double? = Double(blue!)
            blueSl.setValue(Float(blueInt!), animated: true)
        }
        self.colorButton(nil)
    }
    
}
































