//
//  RecordAudioViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/14/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController {

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - decleration
        
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
        
    @IBOutlet weak var recordButton: UIButton!
    
    
    var audioPlayer = AVAudioPlayer()
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var dotView: UIView!
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - loding View Methods

        // override func viewWillAppear
        override func viewDidLoad() {
            super.viewDidLoad()
            
            loadActions(.didLoad)
            setupViewStyle()
        }
        
        // override func viewDidAppear
        
        // override func willDisapear
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
        @objc func recordTapped() {
            if audioRecorder == nil {
                startRecording()
            } else {
                finishRecording(success: true)
            }
        }
    
    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func share(_ sender: Any) {
        
       loadAudioAndShare()
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Methods
        
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
//---------------
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
        
        setUpPlaySystem()
    }
//--------------
    func loadAudioAndShare(){

       
        let path = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let fileManager = FileManager.default

        if fileManager.fileExists(atPath: path.path) {
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [path], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        } else {
            print("document was not found")
            let alertController = UIAlertController(title: "Error", message: "Document was not found!", preferredStyle: .alert)
            let defaultAction = UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(defaultAction)
//            UIViewController.RecordAudioViewController()?.present(alertController, animated: true, completion: nil)
        }
    }
    
//---------------
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Setup View
    func setupData(){
        
    }
    func setupViewStyle(){
        recordButton.layer.masksToBounds = true
        recordButton.layer.cornerRadius = recordButton.frame.height/4
        
        playButton.layer.masksToBounds = true
        playButton.layer.cornerRadius = playButton.frame.height/4
        
        shareButton.layer.masksToBounds = true
        shareButton.layer.cornerRadius = shareButton.frame.height/4
        
        dotView.layer.masksToBounds = true
        dotView.layer.cornerRadius = dotView.frame.height/2
    }


    func loadActions(_ atMethod : LoadingViewTypes = .willAppear){
        switch atMethod {
        case .willAppear:
            break
            //do nothing
        case .didLoad:
            
            setUpRecordingSystem()
//            setUpPlaySystem()
            
        case .didAppear:
            break
        case .willDisapear:
            break
        }
    }
    
//---------------
    func setUpRecordingSystem(){
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
    }
    
//---------------
    func setUpPlaySystem(){
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
        }catch{
            print(error)
        }
    }
    
//---------------
    func loadRecordingUI() {
//        recordButton = UIButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
        recordButton.setTitle("Tap to Record", for: .normal)
//        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
//        view.addSubview(recordButton)
    }
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Navegation
        /*

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Extensions
extension RecordAudioViewController : AVAudioRecorderDelegate{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
}



    //////////////////////////////////////////////////////////////////////////////////
    // MARK: - NetWorkig
