//
//  OpportunitiesViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/15/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class OpportunitiesViewController: UIViewController {

    @IBOutlet weak var OpportunitiesTableView: UITableView!
    
    struct Opportunity {
        var title: String
        var details: String
    }
    
    var hs_programs: [Opportunity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
