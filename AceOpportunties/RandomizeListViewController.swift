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
    
    //////////// FUNCTIONS /////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Opportunity")
        request.predicate = NSPredicate(format: "list == %@", NSNumber(booleanLiteral: true))
        do {
            listOpportunities = try context.fetch(request) as! [Opportunity]
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func getRecommendation() {
        if (listOpportunities.count < 1) {
            recommendLabel.text = "Add more to your list!"
        }
        else {
            var randomOpportunity = listOpportunities.randomElement()
            recommendLabel.text = randomOpportunity?.title
        }
    }

    @IBAction func randomizePressed(_ sender: Any) {
        getRecommendation()
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
