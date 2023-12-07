import SwiftUI
import Cocoa

class useAccessibility {
    var mouseClickMonitor: Any?
    var clicks = useClicks.shared
    
    func subscribe() {
        let mask: NSEvent.EventTypeMask = [.leftMouseDown, .rightMouseDown]
        let handler: (NSEvent) -> Void = { event in
            self.clicks.addClick(nseventTimestamp: event.timestamp, x: event.absoluteX, y: event.absoluteY)
        }
        mouseClickMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    func unsubscribe() {
        if let monitor = mouseClickMonitor {
            NSEvent.removeMonitor(monitor)
        }
    }
    
    func checkPermissions() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]

        let isAccessibilityEnabled = AXIsProcessTrustedWithOptions(options)

        if isAccessibilityEnabled {
            print("Accessibility permissions granted.")
        } else {
            print("Accessibility permissions not granted.")
        }
    }
}
