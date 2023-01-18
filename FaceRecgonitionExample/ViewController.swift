//
//  ViewController.swift
//  FaceRecgonitionExample
//
//  Created by Ian MacKinnon on 18/01/2023.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signinClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if(authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true{
                    //this should be run on a main thread and not the background thread or it will crash due to not being able to update UI here
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }else{
                    //this should be run on a main thread and not the background thread or it will crash due to not being able to update UI here
                    DispatchQueue.main.async {
                        self.myLabel.text = "Doesn't seem like it is you!"
                    }
                }
            }
        }
        
    }
    
}

