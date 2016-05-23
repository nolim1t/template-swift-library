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
    
    // Do a blocks based API example
    // Reference: https://raw.githubusercontent.com/Kuggleland/kuggle-api-swift/master/Classes/KuggleAPI.swift
    // And other project that isn't public
    func registerUser(emailAddress: String, password: String, name: String, responseCompletionHandler: (result: AnyObject?, error: NSError?)) -> Void {
        let response = ["result": []]
        
        responseCompletionHandler(result: response, error: nil)
    }    
}
