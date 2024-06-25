import SwiftUI

struct Level6View: View {
    @Binding var unlockedLevel: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var isLevelCompleted = false
    
    var body: some View {
        VStack {
            Text("Level 6")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                isLevelCompleted = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    unlockedLevel = 7 // Assuming this unlocks some final completion or next stage
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Complete Level 6")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    Level6View(unlockedLevel: .constant(6))
}
