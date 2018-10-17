//
//  StoreListViewController.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 15/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import CoreData

class StoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var myStores:[NSManagedObject]=[];
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden=false;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myStores.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.myStores[indexPath.row].value(forKeyPath: "name") as? String
        return cell;
    }
    
}
