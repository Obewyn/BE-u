import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var captureSession: AVCaptureSession!
    var videoOutput: AVCaptureMovieFileOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        
        let recordButton = UIButton(type: .system)
        recordButton.setTitle("Record", for: .normal)
        recordButton.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
        recordButton.frame = CGRect(x: 20, y: view.frame.height - 100, width: 100, height: 50)
        view.addSubview(recordButton)
    }
    
    func setupCamera() {
        captureSession = AVCaptureSession()
        guard let camera = AVCaptureDevice.default(for: .video) else {
            fatalError("No video camera available")
        }
        
        do {
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            captureSession.addInput(cameraInput)
        } catch {
            fatalError(error.localizedDescription)
        }
        
        videoOutput = AVCaptureMovieFileOutput()
        captureSession.addOutput(videoOutput)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    @objc func recordButtonTapped() {
        if !videoOutput.isRecording {
            let outputPath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("video.mp4")
            videoOutput.startRecording(to: outputPath, recordingDelegate: self)
        } else {
            videoOutput.stopRecording()
        }
    }
}

extension ViewController: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            print("Video recording failed: \(error.localizedDescription)")
        } else {
            uploadVideo(outputFileURL)
        }
    }
    
    func uploadVideo(_ videoURL: URL) {
        // Implement video upload logic here
    }
}
