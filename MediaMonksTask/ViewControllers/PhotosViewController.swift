//
//  PhotosViewController.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import UIKit

class PhotosViewController: CommonViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var photoTableView: UITableView!

    var photoArray = [PhotoViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photos".uppercased()
        
        self.gettingPhotoList()
        photoTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    // MARK:- Common Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? PhotoDetailsViewController {
            guard let cell = sender as? PhotoTableViewCell else { return }
            
            guard let indexPath = photoTableView.indexPath(for: cell) else { return }
            vc.titleString = photoArray[indexPath.row].title
            vc.urlString = photoArray[indexPath.row].url
        }
    }
    
    
    // MARK:- Calling Services Methods
    
    func gettingPhotoList() {
        
        let urlString = BASE_URL + "photos"
        
        self.startLoading()
        NetworkHandler.makeRequest(urlString: urlString, parameter: nil, httpMethod: .GET, success: { (data) in
            
            DispatchQueue.main.async {
                self.stopLoading()
                do {
                    let photoListArray = try JSONDecoder().decode([PhotoListDetails].self, from: data)
                    self.photoArray = photoListArray.map({
                        PhotoViewModel($0)
                    })
                    self.photoTableView.delegate = self
                    self.photoTableView.dataSource = self
                    self.photoTableView.reloadData()
                    
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
        return photoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? PhotoTableViewCell {
            
            let photoList = self.photoArray[indexPath.row]
            cell.titleValue = photoList.title
            if photoList.thumbnailURL != "" {
                cell.thumbUrl = photoList.thumbnailURL
            }
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
}
