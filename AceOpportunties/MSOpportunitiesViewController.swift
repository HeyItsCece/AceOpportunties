//
//  MSOpportunitiesViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/16/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class MSOpportunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /////////////// OUTLETS ////////////////
    @IBOutlet weak var msOpportunitiesTableView: UITableView!
    
    ///////// STRUCTS & CLASSES ////////////
    struct Opportunity {
        var title: String
        var details: String
    }
    
    ////////////// VARIABLES ///////////////
    
    var msOpportunities: [Opportunity] = [Opportunity(title:"Girls Who Code Campus", details:"The Girls Who Code campus program is a two week program which introduces girls from ages  10- 18 to computer science. It offers various courses such as: Intro to computer science, Iphone App development 1,Iphone App development 2,and Web Design. It is held in cities like NYC, los Angeles,Seattle,Boston, Bay Area, and more. Aside from this, Girls Who Code offers discounts and need based scholarships!")]
    
    //////////// FUNCTIONS /////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        self.msOpportunitiesTableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = msOpportunitiesTableView.dequeueReusableCell(withIdentifier: "msCell", for: indexPath)
        cell.textLabel?.text = msOpportunities[indexPath.row].title
        cell.detailTextLabel?.text = msOpportunities[indexPath.row].details
        return cell
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
