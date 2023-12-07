import SwiftUI

struct ClickList: View {
    @ObservedObject var clicks = useClicks.shared
    
    
    var body: some View {
        let allClicks = clicks.allClicks
        let sorted = allClicks.sorted { $0.timestamp > $1.timestamp }
        let prefix = sorted.prefix(3)
        
        VStack {
            Text("ClickList").padding()
            // Iterate over clicks and display information
            ForEach(prefix) { click in
                Text("Timestamp: \(click.timestamp), X: \(click.x), Y: \(click.y)")
                    .padding()
            }
        }
    }
}
