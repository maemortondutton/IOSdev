//
//  ViewController.swift
//  Tip Calculator 2
//
//  Created by Mae School on 1/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Main Screen Outlets
    
    @IBOutlet weak var mainBillAmountTextield: UITextField!
    @IBOutlet weak var mainTipAmountLabel: UILabel!
    @IBOutlet weak var mainTipControl: UISegmentedControl!
    @IBOutlet weak var mainTotalLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First calculate out the device screen width and height.
       let screenSizeArr:Array<Float> = calculateScreenSize()
       
       let screenWidth:Float = screenSizeArr[0]
       
       let screenHeight:Float = screenSizeArr[1]
       
       // The up rectangle top left point x axis position.
       let xPos:Float = 10
       
       // The up rectangle top left point y axis position.
       let yPos:Float = 50
       
       // The up rectangle width.
       let rectWidth:Float = screenWidth - 2 * xPos
       
       // The up rectangle height.
       let rectHeight:Float = screenHeight / 2 - yPos
       
       // Create and add the up rectangle view.
        addColorRectView(red: 0, green: 0.55, blue: 0.75, alpha: 0.8, xPos: xPos, yPos: yPos, width: rectWidth, height: rectHeight)
 
        // Create a lower rectangle below
        addColorRectView(red: 0.1, green: 0.6, blue: 0.2, alpha: 0.4, xPos: xPos, yPos: 420, width: rectWidth, height: rectHeight)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get Bill Amount from text field
        let bill = Double(mainBillAmountTextield.text!) ?? 0
        
        // Get total tip by multiplying by the percentages
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[mainTipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip amount
        mainTipAmountLabel.text = String(format: "$%.2f",  tip)
        // Update total amount
        mainTotalLabel.text = String(format: "$%.2f",  total)
        
    }
    
    func calculateScreenSize() -> Array<Float>{
        var ret:Array<Float> = Array<Float>()
        
        // get screen size object.
        let screenSize: CGRect = UIScreen.main.bounds
        
        // get screen width.
        let screenWidth = screenSize.width
        
        // get screen height.
        let screenHeight = screenSize.height
        
        // append screen width and height in the returned array.
        ret.append(Float(screenWidth))
        
        ret.append(Float(screenHeight))
        
        return ret
    }
    
    /*
     This function will add a rectangle view and set a customize color as it's background color.
     */
    func addColorRectView(red:Float, green:Float, blue:Float, alpha: Float, xPos:Float, yPos:Float, width:Float, height:Float) -> Void {
        
        // Create a CGRect object which is used to render a rectangle.
        let rectFrame: CGRect = CGRect(x:CGFloat(xPos), y:CGFloat(yPos), width:CGFloat(width), height:CGFloat(height))
        
        // Create a UIView object which use above CGRect object.
        let customView = UIView(frame: rectFrame)
        
        // Create a UIColor object which presents the above view's background color.
        let backgroundColor = UIColor(red:CGFloat(red), green:CGFloat(green), blue:CGFloat(blue), alpha:CGFloat(alpha))
        
        // Set UIView background color.
        customView.backgroundColor = backgroundColor
        
        // Add the above UIView object as a subview in the iOS app screen.
        self.view.addSubview(customView)
        self.view.sendSubviewToBack(customView)
    }
    
    /*
     This function will create a UIView object beneath the above UIView object, and set the image as the UIView object's background.
     */
}
