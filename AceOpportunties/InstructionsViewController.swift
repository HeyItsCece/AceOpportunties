//
//  InstructionsViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/18/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func BigFutureWeb(_ sender: Any) {
        let url = URL(string: "https://bigfuture.collegeboard.org/?gclid=CjwKCAjwscDpBRBnEiwAnQ0HQAUKNlyu9q-BzMoDbSiVEwUUUCYRlVA6ybPhAvsNGcKCaUikiDiW6hoCbjQQAvD_BwE&s_kwcid=AL!4330!3!289402000989!b!!g!!%2Bbig%20%2Bfuture%20%2Bcollege%20%2Bboard&ef_id=CjwKCAjwscDpBRBnEiwAnQ0HQAUKNlyu9q-BzMoDbSiVEwUUUCYRlVA6ybPhAvsNGcKCaUikiDiW6hoCbjQQAvD_BwE:G:s")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!,options: [:],completionHandler: nil)
    }
    
    @IBAction func PrincetonWeb(_ sender: Any) {
        let url = URL(string: "https://www.princetonreview.com/college-search")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!,options: [:],completionHandler: nil)
    }
    
    @IBAction func CappexWeb(_ sender: Any) {
        let url = URL(string: "https://www.cappex.com")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!,options: [:],completionHandler: nil)
    }
    
    @IBAction func SchollyWeb(_ sender: Any) {
        let url = URL(string: "https://myscholly.com")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!,options: [:],completionHandler: nil)
    }
    
    @IBAction func KhanWeb(_ sender: Any) {
        let url = URL(string: "https://www.khanacademy.org")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!,options: [:],completionHandler: nil)
    }
    
    @IBAction func GrammerWeb(_ sender: Any) {
        let url = URL(string: "https://www.grammarcheck.net/editor/")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!,options: [:],completionHandler: nil)
    }
    
    @IBAction func QuizletWeb(_ sender: Any) {
        let url = URL(string: "https://quizlet.com")
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!,options: [:],completionHandler: nil)
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
