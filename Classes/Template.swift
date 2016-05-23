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
    
    // TODO:  Do a blocks based API example
}
