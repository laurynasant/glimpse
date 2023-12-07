import SwiftUI

class useOperation: ObservableObject {
    @Published var isRunning = false
    var json = useJson()
    var accessibility = useAccessibility()

    var menuTitle: String { isRunning ? "Stop" : "Start" }
    var systemImage: String { isRunning ? "cursorarrow" : "cursorarrow.slash"}
    
    func quit() {
        accessibility.unsubscribe()
        json.write()
        NSApplication.shared.terminate(self)
    }
    func start() {
        accessibility.subscribe()
        print("start")
    }
    func stop() {
        accessibility.unsubscribe()
        print("stop")
    }

    func toggle() {
        if self.isRunning {
            stop()
        } else {
            start()
        }
        self.isRunning = !self.isRunning
    }
}
