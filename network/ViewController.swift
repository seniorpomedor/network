import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

extension JSON {init?(_ data: Any?) {if let data = data {self.init(data)} else {return nil}}}

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func getText(_ sender: UIButton) {
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/1").responseJSON {
            [weak self]
            response in
            if let json = JSON(response.result.value) {
                if let title = json["title"].string, let body = json["body"].string {
                    self?.textView.text = title + "\n\n" + body
                }
            }
        }
    }
    @IBAction func getImage(_ sender: UIButton) {
        Alamofire.request("https://staticdelivery.nexusmods.com/mods/110/images/74627-0-1459502036.jpg").responseImage {
            [weak self]
            response in
            self?.imageView.image = response.result.value
        }
    }
}
