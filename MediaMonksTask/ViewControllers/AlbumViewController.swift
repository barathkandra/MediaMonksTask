//
//  AlbumViewController.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import UIKit

class AlbumViewController: CommonViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var albumTableView: UITableView!

    var albumArray = [AlbumViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gettingAlbumDetails()
        self.title = "Album".uppercased()
        albumTableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }

    
    
    // MARK:- Common Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // MARK:- Calling Services Methods
    
    func gettingAlbumDetails() {
        
        let urlString = BASE_URL + "albums"
        
        if !Reachability.isConnectedToNetwork() {
            Toast.shared().showNoInternetToast()
            return
        }
        
        self.startLoading()
        
        NetworkHandler.makeRequest(urlString: urlString, parameter: nil, httpMethod: .GET, success: { (data) in
            
            DispatchQueue.main.async {
                
                self.stopLoading()

                do {
                    let albumArray = try JSONDecoder().decode([AlbumListDetails].self, from: data)
                    
                    self.albumArray = albumArray.map({
                        AlbumViewModel($0)
                    })
                    
                    self.albumTableView.delegate = self
                    self.albumTableView.dataSource = self
                    self.albumTableView.reloadData()
                    
                } catch {
                    Toast.shared().showToast(withDuration: 3, afterDelay: 0.5, withMessage: error.localizedDescription, toastType: .error, hideToastAfterCompletion: true)
                }
            }
        }) { (error) in
            Toast.shared().showToast(withDuration: 3, afterDelay: 0.5, withMessage: error.localizedDescription, toastType: .error, hideToastAfterCompletion: true)
        }
    }
    
    
    // MARK:- UITableView Delegate and Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as? AlbumTableViewCell {
            cell.title = self.albumArray[indexPath.row].title
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
        
    }

}
