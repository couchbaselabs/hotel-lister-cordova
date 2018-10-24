import CouchbaseLiteSwift

@objc(HotelLister) class HotelLister : CDVPlugin {
    
    var database: Database?
    
    // tag::initialize[]
    override func pluginInitialize() {
        self.database = DatabaseManager.sharedInstance().database
    }
    // end::initialize[]
    
    // tag::query-hotels[]
    @objc(queryHotels:)
    func queryHotels(command: CDVInvokedUrlCommand) {
        let DOC_TYPE = "hotel";

        let query = QueryBuilder
            .select(
                SelectResult.expression(Meta.id),
                SelectResult.property("address"),
                SelectResult.property("phone"),
                SelectResult.property("name")
            )
            .from(DataSource.database(database!))
            .where(
                Expression.property("type")
                    .equalTo(Expression.string(DOC_TYPE))
        )
        
        do {
            let resultSet = try query.execute()
            let resultSetArray = resultSet.allResults()
            var array = [Any]()
            for item in resultSetArray {
                array.append(item.toDictionary())
            }
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: array)
            self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
        } catch {
            fatalError(error.localizedDescription);
        }
    }
    // end::query-hotels[]
    
}
