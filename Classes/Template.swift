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
    func helloSwift(test: String) -> Bool {
        if (test == "hello") {
            return true
        } else {
            return false
        }
    }
    
    // Blocks based API example
    func checkCredentials(responseCompletionHandler: (loggedIn: Bool, error: NSError?) -> Void) -> Void {
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
}
