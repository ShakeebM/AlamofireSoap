//
//  MasterViewController.swift
//
//  Copyright (c) 2014-2017 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import AlamofireSoap
import Alamofire

class MasterViewController: UITableViewController, UISplitViewControllerDelegate {

      @IBOutlet var titleImageView: UIImageView!

      var detailViewController: DetailViewController?
      var objects = NSMutableArray()

      private var reachability: NetworkReachabilityManager!

      // MARK: - View Lifecycle
      override func awakeFromNib() {
          super.awakeFromNib()

          navigationItem.titleView = titleImageView
          clearsSelectionOnViewWillAppear = true

          monitorReachability()
      }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return false
    }
    
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        if let split = splitViewController {
//            let controllers = split.viewControllers
//            split.delegate = self
//            if
//                let navigationController = controllers.last as? UINavigationController,
//                let topViewController = navigationController.topViewController as? DetailViewController
//            {
//                detailViewController = topViewController
//                detailViewController?.request = AlamofireSoap.soapRequest("http://www.dneonline.com/calculator.asmx", soapmethod: "Add", soapparameters: ["intA":"1","IntB":"2"], namespace: "http://tempUri.org")
//            }
//        }
//    }

    // MARK: - UIStoryboardSegue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let navigationController = segue.destination as? UINavigationController,
            let detailViewController = navigationController.topViewController as? DetailViewController
        {
            func requestForSegue(_ segue: UIStoryboardSegue) -> Request? {
                switch segue.identifier! {
                case "GET":
                    detailViewController.segueIdentifier = "GET"
                    return AF.request("https://httpbin.org/get")
                case "POST":
                    detailViewController.segueIdentifier = "POST"
                    return AF.request("https://httpbin.org/post", method: .post)
                case "PUT":
                    detailViewController.segueIdentifier = "PUT"
                    return AF.request("https://httpbin.org/put", method: .put)
                case "DELETE":
                    detailViewController.segueIdentifier = "DELETE"
                    return AF.request("https://httpbin.org/delete", method: .delete)
                case "SOAPREQUEST":
                    detailViewController.segueIdentifier = "SOAPREQUEST"
                    return AlamofireSoap.soapRequest("http://www.dneonline.com/calculator.asmx", soapmethod: "Add", soapparameters: ["intA":"1","intB":"2"], namespace: "http://tempuri.org")
                    
                case "DOWNLOAD":
                    detailViewController.segueIdentifier = "DOWNLOAD"
                    let destination = DownloadRequest.suggestedDownloadDestination(
                        for: .cachesDirectory,
                        in: .userDomainMask
                    )
                    return AF.download("https://httpbin.org/stream/1", to: destination)
                default:
                    return nil
                }
            }

            if let request = requestForSegue(segue) {
                detailViewController.request = request
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 && indexPath.row == 0 {
            print("Reachability Status: \(reachability.status)")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    private func monitorReachability() {
        NetworkReachabilityManager.default?.startListening { status in
            print("Reachability Status Changed: \(status)")
        }
    }
}

