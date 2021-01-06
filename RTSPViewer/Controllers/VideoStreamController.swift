//
//  VideoStreamController.swift
//  RTSPViewer
//
//  Created by mani on 2020-01-26.
//  Copyright © 2020 mani. All rights reserved.
//

import UIKit

class VideoStreamController: UIViewController {
    
    @IBOutlet weak var leftEyeView: VideoView!
    @IBOutlet weak var rightEyeView: VideoView!
    
    var videoStreamURL: URL? {
        willSet {
            if let url = newValue {
                if let leftViewPort = leftEyeView {
                    leftViewPort.loadVideo(from: url)
                }
                
                if let rightViewPort = rightEyeView {
                    rightViewPort.loadVideo(from: url)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = videoStreamURL else { return }

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        leftEyeView.addGestureRecognizer(tapRecognizer)
        rightEyeView.addGestureRecognizer(tapRecognizer)
        
        title = url.host

        navigationController?.setNavigationBarHidden(true, animated: false)

        leftEyeView.loadVideo(from: url)
        rightEyeView.loadVideo(from: url)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}

extension VideoStreamController {
    // MARK: Device Orientation

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var shouldAutorotate: Bool {
        return true
    }
}

extension VideoStreamController {
// MARK: IBActions

    @IBAction func close(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @objc func handleTap() {
        if let hidden = navigationController?.isNavigationBarHidden {
            navigationController?.setNavigationBarHidden(!hidden, animated: true)
        }
    }
}
