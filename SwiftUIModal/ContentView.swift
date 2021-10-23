import SwiftUI

struct MyModal: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            //Color.yellow //.ignoresSafeArea()
            Text("modal content").padding(20)
            Button("Close") { show.toggle() }
        }
        .background(.red)
    }
}

struct ContentView: View {
    @State private var showModal = false
    
    var body: some View {
        VStack {
            Text("main view")
            Button(action: { showModal = true }) {
                Text("Show Modal")
                .padding()
                .background(.yellow)
                .cornerRadius(10)
            }
            .sheet(isPresented: $showModal) {
                // By default the sheet slides in from the bottom.
                MyModal(show: $showModal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
