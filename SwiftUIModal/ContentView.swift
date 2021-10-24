import SwiftUI

struct MyModal: View {
    // Passing a Binding so the Close button here can modify the value.
    @Binding var show: Bool
    var message: String
    
    var body: some View {
        VStack {
            Text("My Modal").font(.title)
            Spacer()
            Text(message).padding(20)
            Spacer()
            Button("Close") { show.toggle() }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.2))
    }
}

struct ContentView: View {
    @State private var count = 0
    @State private var message = "Opened once"
    @State private var showModal = false
    
    var body: some View {
        VStack {
            Text("Main View")
            Button(action: {
                count += 1
                message = "Opened \(count) times"
                showModal = true
            }) {
                Text("Show Modal")
                .padding()
                .background(.yellow)
                .cornerRadius(10)
            }
            .sheet(isPresented: $showModal) {
                // By default the sheet slides in from the bottom.
                MyModal(show: $showModal, message: message)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
