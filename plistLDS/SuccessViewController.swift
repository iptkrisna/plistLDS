//
//  SuccessViewController.swift
//  plistLDS
//
//  Created by I Putu Krisna on 04/07/19.
//  Copyright © 2019 I Putu Krisna. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var labelData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
    }
    
    func loadData() {
        var path = documentFilePath(fileName: "Data.plist")
        var dict : NSDictionary? = NSDictionary(contentsOfFile: path)
        // Load gamedata template from mainBundle if no saveFile exists
        if dict == nil {
            let mainBundle = Bundle.main
            path = mainBundle.path(forResource: "Data", ofType: "plist")!
            dict = NSDictionary(contentsOfFile: path)
            
        }
        
        let fname = dict?.object(forKey: "fname") as! String
        let sname = dict?.object(forKey: "sname") as! String
        
        labelData.text = fname + " " + sname + ": Login Success!"
        
    }
    
    func documentFilePath(fileName: String) -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        return fileURL.path
    }

}
