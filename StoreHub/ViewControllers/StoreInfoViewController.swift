//
//  StoreInfoViewController.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 16/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class StoreInfoViewController: UIViewController {

    var fbCustom:FirebaseCustom?;
    @IBOutlet weak var UIStoreName: UILabel!
    @IBOutlet weak var UIBGImage: UIImageView!
    @IBOutlet weak var UIProfileImage: UIImageView!
    
    @IBOutlet weak var UIReview: UILabel!
    @IBOutlet weak var UIProductCount: UILabel!
    @IBOutlet weak var UIResponseRate: UILabel!    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
