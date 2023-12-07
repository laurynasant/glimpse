import SwiftUI

struct AppMenu: View {
    @EnvironmentObject var operation: useOperation

    var body: some View {
        ClickList()
        Divider()
        Button(action: operation.toggle, label: {
            Text(operation.menuTitle)
        })
        Button(action: operation.quit, label: { Text("Quit") })
    }
}
