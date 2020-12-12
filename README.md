# Aboput RV_camera_mjpeg
MJPEG camera with OpenCV annotation for RV reversing lines

Viewing app for mjpeg-streamer camera that allows the user to add reversing distance lines to a raspberry pi camera 
https://github.com/chrissweet/mjpg-streamer.

RV_camera_mjpeg is based on a simple and elegant MJPEG Stream library. It is based on UIImageView and customizeable for your design.
This is original a fork from [MjpegStreamingKit](https://github.com/freedom27/MjpegStreamingKit). The original Author Kuray OGUN, 
kurayogun@gmai.com, with an MIT license.

## MJPEGStreamLib Use
```ruby

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    var stream: MJPEGStreamLib!
    var url: URL?

    override func viewDidLoad() {
    super.viewDidLoad()

        // Set the ImageView to the stream object
        stream = MJPEGStreamLib(imageView: imageView)
        // Start Loading Indicator
        stream.didStartLoading = { [unowned self] in
        self.loadingIndicator.startAnimating()
    }
        // Stop Loading Indicator
        stream.didFinishLoading = { [unowned self] in
        self.loadingIndicator.stopAnimating()
    }

        // Your stream url should be here !
        let url = URL(string: "http://webcam.st-malo.com/axis-cgi/mjpg/video.cgi?")
        stream.contentURL = url
        stream.play() // Play the stream
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Make the Status Bar Light/Dark Content for this View
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
}

```
