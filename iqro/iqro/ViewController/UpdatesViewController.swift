//
//  UpdatesViewController.swift
//  iqro
//
//  Created by admin on 7/8/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit
import SwiftSoup

class UpdatesViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var updatesTableView: UITableView!
    
    var articleTitleArray = [String]()
    var articleDateArray = [String]()
    var articleAuthorArray = [String]()
    var articleUrlArray = [String]()
    
    var articleSize = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webServiceCall()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func webServiceCall() {
        showSpinnerWithMask(true)
        let url = URL(string: "http://www.iqro.org.au/latestupdate/")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.parseHtmlString(html: String(data: data ?? Data(), encoding: .utf8)!)
            self.showSpinnerWithMask(false)
        }
        task.resume()
    }
    
    func parseHtmlString(html: String) {
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let htmlElement = try doc.select(".article-list > article")
            
            for i in 0..<htmlElement.size() {
                let articleTitle = try htmlElement.get(i).select(".entry-title > a").first()!.text()
                let articleDate = try htmlElement.get(i).select(".published > a").first()!.text()
                let articleAuthor = try htmlElement.get(i).select(".author > a").first()!.text()
                let articleUrl = try htmlElement.get(i).select(".entry-title > a").attr("href")
                articleTitleArray.append(articleTitle)
                articleDateArray.append(articleDate)
                articleAuthorArray.append(articleAuthor)
                articleUrlArray.append(articleUrl)
            }
            articleSize = htmlElement.size()
            
            updatesTableView.reloadData()
            } catch Exception.Error(let message) {
            print(message)
        } catch {
            print("error")
        }
    }
    
    func gotoWebView(url: String) {
        let webViewPage = UIStoryboard(name: "Webview", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webViewPage?.webUrl = url
        webViewPage?.pageTitle = "Latest Update"
        navigationController?.pushViewController(webViewPage!, animated: true)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseUrl = "http://www.iqro.org.au"
        let completeUrl = baseUrl + articleUrlArray[indexPath.row]
        gotoWebView(url: completeUrl)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleSize
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpdatesTableViewCell") as! UpdatesTableViewCell
        cell.eventLabel.text = articleTitleArray[indexPath.row]
        cell.dateLabel.text = articleDateArray[indexPath.row]
        cell.userLabel.text = articleAuthorArray[indexPath.row]
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
