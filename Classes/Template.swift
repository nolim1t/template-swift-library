class Template: NSObject {
    class var sharedInstance: Template {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: Template? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = Template()
        }
        return Static.instance!
    }
    
    // So we can write a test for this
    // MARK: - Sample API Function, return response as a return value
    func helloSwift(test: String) -> Bool {
        if (test == "hello") {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Sample API Function, return response within completion handler
    func checkCredentials(responseCompletionHandler: (loggedIn: Bool, error: NSError?) -> ()) -> () {
        // Check something
        let username = KeychainSwift.get("emailaddress")
        let password = KeychainSwift.get("password")
        if username != nil && password != nil {
            // Probably not the best though, you should really check something on the server side
            responseCompletionHandler(loggedIn: true, error: NSError(domain: "Do something cool", code: 0, userInfo: nil))
            )
        } else {
            responseCompletionHandler(loggedIn: false, error: NSError(domain: "Not registered on this device", code: -1, userInfo: nil))
        }
    }
    
    // MARK: - Helper functions
    // Download and Cache image to caches directory
    func didDownloadImage(imageurl: String, responseCompletionHandler: (downloaded: Bool, image: UIImage!, error: NSError!) -> ()) -> () {
        if let url : NSURL = NSURL.init(string: imageurl) {
            let urlrequest : NSURLRequest = NSURLRequest.init(URL: url)
            let arr = imageurl.componentsSeparatedByString("/")
            let filename = arr[arr.count - 1]
            print("Filename: \(filename)")
            let path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as String
            let fileurl = NSURL(fileURLWithPath: path)
            let filePath = fileurl.URLByAppendingPathComponent(filename).path!
            let fileManager = NSFileManager.defaultManager()
            if fileManager.fileExistsAtPath(filePath) {
                print("file exists  at \(filePath)")
                if let filedata = NSData.init(contentsOfFile: filePath) {
                    responseCompletionHandler(downloaded: true, image: UIImage(data: filedata), error: NSError(domain: "Done", code: 0, userInfo: nil))
                } else {
                    responseCompletionHandler(downloaded: false, image: nil, error: NSError(domain: "Unable to read file", code: -1, userInfo: nil))
                }
            } else {
                print("file doesnt exist at \(filePath)")
                NSURLConnection.sendAsynchronousRequest(urlrequest, queue: NSOperationQueue.mainQueue(), completionHandler: {(resp,data,err) -> () in
                    if (err  == nil) {
                        data?.writeToFile(filePath, atomically: true)
                        responseCompletionHandler(downloaded: true, image: UIImage(data: data!), error: NSError(domain: "Done", code: 0, userInfo: nil))
                    } else {
                        responseCompletionHandler(downloaded: false, image: nil, error: NSError(domain: (err?.domain)!, code: -1, userInfo: nil))
                    }
                })
            }
        }
    }    
}
