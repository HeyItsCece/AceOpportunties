//
//  RandomizeListViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/18/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit
import CoreData

class RandomizeListViewController: UIViewController {
    ///////////// OUTLET ///////////////
    @IBOutlet weak var recommendLabel: UILabel!
    
    /////////// VARIABLES //////////////
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var listOpportunities: [Opportunity] = []
    var allOpportunities: [Opportunity] = []
    
    //////////// FUNCTIONS /////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        getListData()
        // Do any additional setup after loading the view.
    }
    
    func getListData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Opportunity")
        request.predicate = NSPredicate(format: "list == %@", NSNumber(booleanLiteral: true))
        do {
            listOpportunities = try context.fetch(request) as! [Opportunity]
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func getCustomData(search:String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Opportunity")
        request.predicate = NSPredicate(format: "ages == %@", search)
        do {
            allOpportunities = try context.fetch(request) as! [Opportunity]
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func getListRecommendation() {
        if (listOpportunities.count < 1) {
            recommendLabel.text = "Add more to your list!"
        }
        else {
            var randomOpportunity = listOpportunities.randomElement()
            recommendLabel.text = randomOpportunity?.title
        }
    }
    
    func getCustomRecommendation(age:String) {
        getCustomData(search:age)
        var randomOpportunity = allOpportunities.randomElement()
        recommendLabel.text = randomOpportunity?.title
    }

    @IBAction func randomizeListPressed(_ sender: Any) {
        getListRecommendation()
    }
    
    @IBAction func randomizeMSPressed(_ sender: Any) {
        getCustomRecommendation(age: "MS")
    }
    
    @IBAction func randomizeHSPressed(_ sender: Any) {
        getCustomRecommendation(age: "HS")
    }
    
    @IBAction func randomizeCollegePressed(_ sender: Any) {
        getCustomRecommendation(age: "college")
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
