//
//  ViewController.swift
//  RadyoKralLondra
//
//  Created by Burak Altunoluk on 12/11/2020.
//  Copyright (c) 2011 **Edell Digital**. All rights reserved.

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var a: String = "https://www.seekpng.com/png/full/302-3025377_9-fm-maui-listen-live-png.png"
    
    var timer:Timer!
    
  // --------- Banner -----------------------------------------------
    
    func banner() {
        
        let url = URL(string:a)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() {    // execute on main thread
                self.myImageView.image = UIImage(data: data)
                
            }
        }
        
        
       
        task.resume()

        
    }
   
  //-------------------------------------------------------------------------
   
    //-----Instagram Button--------
    
    @IBAction func insButton(_ sender: UIButton) {

        
        let appURL = URL(string: "instagram://user?username=kralradyolondra")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL)
        {
            application.open(appURL)
        }
        else
        {
            let webURL = URL(string: "https://instagram.com/kralradyolondra")!
            application.open(webURL)
        }
        
    }
    //-----Button end-------
    
    //-----Play Button------
    @IBOutlet weak var playButtonImage: UIButton!
    
    var state = 0
    var player: AVPlayer?
    
    @IBAction func playButton(_ sender: UIButton) {
        
        playButtonImage.setImage(#imageLiteral(resourceName: "playGood"), for: .normal)
        
        if state == 0 {
            
            let urlString = "http://46.20.4.5:9500/;"
            guard let url = URL.init(string: urlString)
                else {
                    return
            }
            let playerItem = AVPlayerItem.init(url: url)
            player = AVPlayer.init(playerItem: playerItem)
        player?.play()
        state = 1
            playButtonImage.alpha = 1
            print (state)
        }
        else {playButtonImage.setImage(#imageLiteral(resourceName: "pauseGood"), for: .normal)
            player?.pause()
            state = 0
                print (state)}
        
    }
   //-------- Button end ------
    
//------Youtube Button ---------
    func gif () {
        
        
    }
    
    @IBAction func youtubeButton(_ sender: UIButton) {
        
        _ =  "UCh26qTkFtV8AyejYKZZUQ7w"
          let appURL = NSURL(string: "youtube://www.youtube.com/channel/UCh26qTkFtV8AyejYKZZUQ7w")!
          let webURL = NSURL(string: "https://www.youtube.com/channel/UCh26qTkFtV8AyejYKZZUQ7w")!
          let application = UIApplication.shared

          if application.canOpenURL(appURL as URL) {
              application.open(appURL as URL)
          } else {
              // if Youtube app is not installed, open URL inside Safari
              application.open(webURL as URL)
          }
        
        //------- Button end--------
        
                //------Facebook Button --------
    }
   
    @IBAction func facebookButton(_ sender: UIButton) {
       
        let phoneNumber =  "+4477524059292" // you need to change this number
        let appURL = URL(string: "https://api.whatsapp.com/send?phone=+447752409292")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        } else {
            // WhatsApp is not installed
        }
        
    }
    //--------Button end-----
    
    //--------Call Button-----
    
    
    @IBAction func callButton(_ sender: UIButton) {
        
            let url: NSURL = URL(string: "TEL://075446254862")! as NSURL
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
        
    }
    //--------Button end---------
    //-------BackroundPlayMode-------
    override func viewDidLoad() {
        
        URLCache.shared.removeAllCachedResponses()
        
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(counterFunc), userInfo: nil, repeats: true)
         
        
        banner()
        // Activate Audio Playback in Background
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch let error {
            print("Error \(error.localizedDescription)")
        }
       }
    
    //---------BackroundEnd---------
    
    
    @objc func counterFunc() {
        
    banner()
    
        //"https://kralradyo.co.uk/app/1b.jpg"
        
        if a == "https://www.seekpng.com/png/full/302-3025377_9-fm-maui-listen-live-png.png"  {
             
            a = "https://www.seekpng.com/png/full/302-3025377_9-fm-maui-listen-live-png.png"
        }
        else if a == "https://www.seekpng.com/png/full/302-3025377_9-fm-maui-listen-live-png.png" {
        
           a = "https://www.seekpng.com/png/full/302-3025377_9-fm-maui-listen-live-png.png"
            
        }
        else if a == "https://www.seekpng.com/png/full/302-3025377_9-fm-maui-listen-live-png.png" {
            
            a = "https://www.seekpng.com/png/full/302-3025377_9-fm-maui-listen-live-png.png"
        }
        else if a == "https://kralradyo.co.uk/app/4b.jpg"
        
        { a = "https://kralradyo.co.uk/app/5b.jpg" }
        
        else if a == "https://kralradyo.co.uk/app/5b.jpg" {
            
            a = "https://kralradyo.co.uk/app/1b.jpg"
            
        }
        
        banner()
        
        }
    
    
}

