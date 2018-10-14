//
//  AddEvent.swift
//  EventByte
//
//  Created by Grace Choe on 10/13/18.
//  Copyright © 2018 Grace Choe. All rights reserved.
//

import UIKit

class AddEvent: UIViewController {

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventDateTime: UIDatePicker!
    @IBOutlet weak var eventLocation: UITextField!
    @IBOutlet weak var orgName: UITextField!
    @IBOutlet weak var eventDescription: UITextField!
    @IBOutlet weak var orgContact: UITextField!
    @IBOutlet weak var publishBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        eventName.delegate = self
        eventLocation.delegate = self
        orgName.delegate = self
        eventDescription.delegate = self
        orgContact.delegate = self
        */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func publishBtnPressed(_ sender: Any) {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateStr = dateFormatter.string(from: eventDateTime.date)
        let timeStr = timeFormatter.string(from: eventDateTime.date) + ":00"

        print(dateStr)
        print(timeStr)
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://ec2-18-209-35-93.compute-1.amazonaws.com/insert.php")! as URL)
        request.httpMethod = "POST"
        let postString = "a=\(eventName.text!)&b=\(dateStr)&c=\(timeStr)&d=\(eventLocation.text!)&e=\(orgName.text!)&f=\(eventDescription.text!)&g=\(orgContact.text!)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        eventDateTime.resignFirstResponder()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
}
