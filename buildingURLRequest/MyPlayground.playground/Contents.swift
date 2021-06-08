import UIKit


let googleUrl = URL(string: "https://google.com")!

URLSession.shared.dataTask(with: googleUrl,
                           completionHandler: { data, response, error in
//    print("get request to google.com:", data ?? "")
                            
}).resume()



/// Build URL from components
/// https://last-airbender-api.herokuapp.com/api/v1/characters?page=2
/// Builder Pattern: build url peice by peice

var components = URLComponents()
   components.scheme = "https"
   components.host = "last-airbender-api.herokuapp.com"
   components.path = "/api/v1/characters"
   components.queryItems = [
       URLQueryItem(name: "page", value: "2"),
   ]
guard let avatarUrl = components.url else { fatalError() }
print(avatarUrl)

/// Using URL request
/// Adding headers and changing http method
var avatarRequest = URLRequest(url: avatarUrl)
avatarRequest.addValue("text/html", forHTTPHeaderField: "Content-Type")
avatarRequest.httpMethod = "POST"


URLSession.shared.dataTask(with: avatarRequest,
                           completionHandler: { data, response, error in
    print("request to avatar api:", data ?? "")
                            
}).resume()


/// Add query String to URL
func addQueryString(from url: URL, queryName: String, queryValue: String) -> URL {
    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    let queryItem = URLQueryItem(name: queryName, value: queryValue)
    components?.queryItems = [queryItem]
    guard let queryURL = components?.url else { return url }
    return queryURL
}

/// Create Cookie
let cookie = HTTPCookie(properties: [
    .name: "DELIEVERY_ZIP",
    .value: "19107",
    .domain: "www.spyOnYourLocation.com",
    .expires: Date().addingTimeInterval(100_000)
])

/// Set Cookie
if let cookie = cookie {
    HTTPCookieStorage.shared.setCookie(cookie)
}

