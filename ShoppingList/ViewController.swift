//
//  ViewController.swift
//  ShoppingList
//
//  Created by Vince Zipparro on 2/4/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
   
    @IBOutlet weak var listContainer: UITextView!
    
    @IBOutlet weak var desTextField: UITextField!
    @IBOutlet weak var quanTextField: UITextField!
    
    //List that holds the item strings
    var itemList:[String] = []
    
    
    
    @IBAction func addItem(sender: UIButton)
    {
        let numCheck = Int(quanTextField.text!)
        
        
        if(desTextField.text!.isEmpty || quanTextField.text!.isEmpty || desTextField.text! == "    ")
        {
        
            let alertController = UIAlertController(title:"Warning",message:"You must add both a description and quantity.",   preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.Default, handler:nil))
            self.presentViewController(alertController, animated: true, completion: nil)
         
        }
        else if(numCheck == nil)
        {
            
            let alertController = UIAlertController(title:"Warning",message:"Quantity must be an integer.",   preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.Default, handler:nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else
        {
          
            let newItem: String = (quanTextField.text! + "x" + " " + desTextField.text!)
            itemList.append(newItem)
            let string = itemList.joinWithSeparator("\u{0085}")
            listContainer.text = string
            
        }
        
      
    }
    
    @IBAction func clearTextField(sender: UIButton)
    {
        quanTextField.text = " "
        desTextField.text = " "
    }
    
    @IBAction func newList(sender: UIButton)
    {
        itemList = []
        listContainer.text = "No Items"
        
    }
    
    @IBAction func editEnded(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(sender: UIControl)
    {
        
        quanTextField.resignFirstResponder()
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

