//
//  RegisterViewController.swift
//  plistLDS
//
//  Created by I Putu Krisna on 28/06/19.
//  Copyright © 2019 I Putu Krisna. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var fnameTF: UITextField!
    @IBOutlet weak var snameTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        saveData()
        performSegue(withIdentifier: "register", sender: self)
        
    }
    
    func saveData() {
        //Write custom plist data to local directory
        let dest = documentFilePath(fileName: "Data.plist")
        print(dest)
        
        let objects = [fnameTF.text, snameTF.text, usernameTF.text, passwordTF.text] as! [String]
        let keys = ["fname", "sname", "username", "password"]
        let data = NSDictionary(objects: objects, forKeys: keys as [NSCopying])
        
        data.write(toFile: dest, atomically: true)
        
    }
    
    func documentFilePath(fileName: String) -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        return fileURL.path
    }

}
