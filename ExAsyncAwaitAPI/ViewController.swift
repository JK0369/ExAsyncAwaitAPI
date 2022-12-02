//
//  ViewController.swift
//  ExAsyncAwaitAPI
//
//  Created by 김종권 on 2022/12/02.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // not async await
    API.fetchAlbums { result in
      switch result {
      case let .success(response):
        print(response)
      case let .failure(error):
        print(error)
      }
    }

    // async await
    Task {
      do {
        let result = try await API.fetchAlbums()
        print(result)
      } catch {
        print(error)
      }
    }
    
    
  }
}
