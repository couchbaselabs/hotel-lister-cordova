// tag::setup-database[]
import CouchbaseLiteSwift

class DatabaseManager {

    private static var privateSharedInstance: DatabaseManager?

    var database: Database

    let DB_NAME = "travel-sample"

    class func sharedInstance() -> DatabaseManager   {
        guard let privateInstance = DatabaseManager.privateSharedInstance else {
            DatabaseManager.privateSharedInstance = DatabaseManager()
            return DatabaseManager.privateSharedInstance!
        }
        return privateInstance
    }

    private init() {
        let path = Bundle.main.path(forResource: self.DB_NAME, ofType: "cblite2")!
        if !Database.exists(withName: self.DB_NAME) {
            do {
                try Database.copy(fromPath: path, toDatabase: self.DB_NAME, withConfig: nil)
            } catch {
                fatalError("Could not copy database")
            }
        }
        do {
            self.database = try Database(name: "travel-sample")
        } catch {
            fatalError("Could not copy database")
        }
    }

}
// end::setup-database[]
