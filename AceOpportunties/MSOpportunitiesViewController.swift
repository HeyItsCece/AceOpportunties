//
//  MSOpportunitiesViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/16/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit
import CoreData

class MSOpportunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /////////////// OUTLETS ////////////////
    @IBOutlet weak var msOpportunitiesTableView: UITableView!
    
    ////////////// VARIABLES ///////////////
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var msOpportunities: [Opportunity] = []
    var msOpportunities_titles: [String] = ["Girls Who Code Campus","STEM matters"]
    var msOpportunities_details: [String] = ["The Girls Who Code campus program is a two week program which introduces girls from ages  10- 18 to computer science. It offers various courses such as: Intro to computer science, Iphone App development 1,Iphone App development 2,and Web Design. It is held in cities like NYC, los Angeles,Seattle,Boston, Bay Area, and more. Aside from this, Girls Who Code offers discounts and need based scholarships!","This program is for students in grades K-11. This program offers different materials in topics from aerospace to animal science, marine biology to mechanics, and ecology to engineering. This also allows for week long programs, highschool internships, and four week long programs that allow for college credit!"]
    var msOpportunities_links: [String] = ["https://girlswhocode.com/campus/","https://www.schools.nyc.gov/enrollment/enroll-in-summer-school/summer-academy"]
    
    //////////// FUNCTIONS /////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getData()
        self.msOpportunitiesTableView.estimatedRowHeight = 100
        self.msOpportunitiesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func getData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Opportunity")
        request.predicate = NSPredicate(format: "ages = %@", "MS")
        do {
            msOpportunities = try context.fetch(request) as! [Opportunity]
            if (msOpportunities.count == 0) {
                for i in 0 ... msOpportunities_titles.count - 1 {
                    var test: Opportunity = Opportunity(context: context)
                    test.title = msOpportunities_titles[i]
                    test.details = msOpportunities_details[i]
                    test.ages = "MS"
                    test.link = msOpportunities_links[i]
                    msOpportunities.append(test)
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            }
            /* MAKES DELETING CORE DATA LESS PAINFUL
            msOpportunities = try context.fetch(Opportunity.fetchRequest())
            for i in 0 ... msOpportunities.count - 1 {
                self.context.delete(msOpportunities[i])
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            */
            
            DispatchQueue.main.async {
                self.msOpportunitiesTableView.reloadData()
            }
            print(msOpportunities[0].link)
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(msOpportunities.count)
        return msOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = msOpportunitiesTableView.dequeueReusableCell(withIdentifier: "msCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = msOpportunities[indexPath.row].title
        cell.detailTextLabel?.text = msOpportunities[indexPath.row].details
        cell.accessoryType = .detailDisclosureButton
        //var button: UIButton = UIButton(buttonWithType:UIButtonTypeCustom);
        //button.tag = indexPath.row;
        //button.addTarget:self action:@selector(buttonClicked(_):)), forControlEvents:UIControlEventTouchDown];
        //[cell addsubview: selectTaskBtn]
        print("\(msOpportunities[indexPath.row].link)")
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        var url = URL(string:msOpportunities[indexPath.row].link!)
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!, options: [:],completionHandler: nil)
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
