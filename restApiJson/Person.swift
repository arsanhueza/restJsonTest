import GRDB

class Person: Record {
    var id: Int64?
    var name: String
    var fecha: String
    
    init(name: String, fecha: String) {
        self.name = name
        self.fecha = fecha
        super.init()
    }
    
    // MARK: Record overrides
    
    override class var databaseTableName: String {
        return "persons"
    }
    
    required init(row: Row) {
        id = row["id"]
        name = row["nombre"]
        fecha = row["fecha"]
        super.init(row: row)
    }
    
    override func encode(to container: inout PersistenceContainer) {
        container["id"] = id
        container["nombre"] = name
        container["fecha"] = fecha
    }
    
    override func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
    
    // MARK: Random
    
    private static let names = ["Arthur", "Anita", "Barbara", "Bernard", "Craig", "Chiara", "David", "Dean", "Éric", "Elena", "Fatima", "Frederik", "Gilbert", "Georgette", "Henriette", "Hassan", "Ignacio", "Irene", "Julie", "Jack", "Karl", "Kristel", "Louis", "Liz", "Masashi", "Mary", "Noam", "Nicole", "Ophelie", "Oleg", "Pascal", "Patricia", "Quentin", "Quinn", "Raoul", "Rachel", "Stephan", "Susie", "Tristan", "Tatiana", "Ursule", "Urbain", "Victor", "Violette", "Wilfried", "Wilhelmina", "Yvon", "Yann", "Zazie", "Zoé"]
    
    private static let fechas = ["Ayer", "Hoy", "Mañana"]

    
    class func randomName() -> String {
        return names[Int(arc4random_uniform(UInt32(names.count)))]
    }
    
    class func randomFechas() -> String {
        return fechas[Int(arc4random_uniform(UInt32(names.count)))]
    }

}
