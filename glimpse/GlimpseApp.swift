import SwiftUI

@main
struct GlimpseApp: App {
    @StateObject var operation = useOperation()
    var accessibility = useAccessibility()
    var json = useJson()
    
    init() {
        accessibility.checkPermissions()
        json.read()
    }
    
    var body: some Scene {
        MenuBarExtra("GlimpseApp", systemImage: operation.systemImage) {
            AppMenu().environmentObject(operation)
        }
    }
}
