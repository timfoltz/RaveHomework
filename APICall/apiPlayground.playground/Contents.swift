import UIKit


let urlString = "https://www.google.com"
let url = URL(string: urlString)!

//completion = { (data) in
//    let decodedata =
//    myTextlabel.text = decodedData.name
//
//}

//class URLSEssion {
//    func dataTask(with url: URL, completion: (data,response, error) -> Void) {
//        completion(data)
//    }
//}

URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
    guard let data = data else { fatalError()}
    
    let decodedData = //decode here
        
    print(decodedData.name)
})


