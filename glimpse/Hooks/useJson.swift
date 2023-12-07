import Foundation

class useJson {
    var clicks = useClicks.shared
    
    func read() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("clicks.json")
        print("reading \(fileURL)")

        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                clicks.allClicks = try decoder.decode([Click].self, from: jsonData)
                print("loaded \(clicks.allClicks.count) clicks")
            } catch {
                print("Error reading or decoding JSON data: \(error)")
            }
        } else {
            print("No file found")
        }
    }
    func write() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        print("JSON write: \(clicks.allClicks.count)")
        do {
            let jsonData = try encoder.encode(clicks.allClicks)
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent("clicks.json")

            try jsonData.write(to: fileURL)
            print("JSON data saved to: \(fileURL.path)")

        } catch {
            print("Error encoding or writing JSON data: \(error)")
        }
    }
}
