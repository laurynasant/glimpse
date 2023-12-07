import Foundation

class useClicks: ObservableObject {
    static let shared = useClicks()
    
    @Published var allClicks: [Click]  = []
    private var lastAssignedID: Int = 0
    
    func addClick(click: Click) {
        objectWillChange.send()
        allClicks.append(click)
    }
    
    func addClick(nseventTimestamp: Double, x: Int, y: Int) {
        let timestamp = convertTS(nseventTimestamp: nseventTimestamp)
        let click = Click(id: generateID(), timestamp: timestamp, x: x, y: y)
        objectWillChange.send()
        allClicks.append(click)
    }
    
    private func generateID() -> Int {
        lastAssignedID += 1
        return lastAssignedID
    }
    
    func convertTS(nseventTimestamp: Double) -> Double {
        let processInfo = ProcessInfo.processInfo
        let systemUptime = processInfo.systemUptime
        let epochTimestamp = Date().timeIntervalSince1970 - systemUptime + nseventTimestamp
        return epochTimestamp
    }
}
