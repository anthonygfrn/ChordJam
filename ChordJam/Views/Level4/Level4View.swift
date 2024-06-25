import SwiftUI

struct Level4View: View {
    @Binding var unlockedLevel: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var isLevelCompleted = false
    
    var body: some View {
        VStack {
            Text("Level 4")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                isLevelCompleted = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    unlockedLevel = 5
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Complete Level 4")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    Level4View(unlockedLevel: .constant(4))
}
