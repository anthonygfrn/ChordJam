import SwiftUI

struct Level6View: View {
    @ObservedObject var viewModel = Level6ViewModel()
    @StateObject var manager = chordModel()
    @StateObject var detection = StringDetection()
    @State private var currentChordIndex = 0
    @State private var viewLoaded: Bool = false
    @State private var level  = 6
    @State private var navigate = false

    private var getFretBoardLong: Int {
        return Int(ceil(Double(viewModel.lyrics.last!.time) / 2.0 )) + 10
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    LazyHStack(spacing: 0) {
                        ForEach(2..<getFretBoardLong) { index in
                            FretView(index: index, chords: viewModel.chords)
                        }
                        Spacer()
                    }
                    .background(
                        GeometryReader { proxy in
                            Color.clear.onAppear {
                                if !viewLoaded {
                                    viewModel.contentWidth = proxy.size.width
                                    viewLoaded = true
                                    viewModel.startLyrics()
                                }
                            }
                        }
                    )
                    .offset(x: viewModel.offset)
                }
                .environmentObject(viewModel)
                .environmentObject(manager)
                .frame(width: geometry.size.width, alignment: .bottomLeading)
            }
            .overlay(
                ZStack{
                    if(viewModel.musicPlayerState == MusicPlayerState.pause){
                            PauseComponent(retryAction: {
                                viewModel.resetMusic()
                            }, exitAction: {
                                navigate = true
                            }, resumeAction: {
                                viewModel.resumeMusic()
                            }).background{
                                NavigationLink(destination: MainMenuView(unlockedLevel: $level).navigationBarBackButtonHidden(), isActive: $navigate) {EmptyView()}
                            }
                    }
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.accent)
                        .frame(width: 8, height: 270)
                        .offset(x: -300)
                        .shadow(color: .accent, radius: 10, x: 0, y: 0)
                        .blur(radius: 2)
                    
                    VStack {
                        Text(viewModel.currentLyric)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
                    .offset(y: 160)
                    .animation(.easeInOut(duration: 0.5), value: viewModel.currentLyric)
                    
                    if (viewModel.chordImage != nil){
                        Image(getImageChord(type: viewModel.chordImage!))
                            .offset(x: 300, y: 80)
                            .transition(.opacity)
                            .animation(.easeInOut, value: viewModel.chordImage)
                    }
                    
                    if(viewModel.musicPlayerState != MusicPlayerState.pause){
                        Button(action: {
                            viewModel.pauseMusic()
                        }, label: {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                        })
                        .offset(x: 350, y: -160)
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        .frame(maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "2A2A2A"), Color(hex: "434343")]), startPoint: .leading, endPoint: .trailing)
        )
        .task{
            manager.startAudioEngine()
        }
        .onReceive(viewModel.$currentTime, perform: { time in
            if viewLoaded {

            }
        })
    }
    
    func getImageChord(type: ChordType) -> ImageResource {
        switch type {
        case .D:
                .chordD
        case .E:
                .chordD
        case .A:
                .chordD
        case .G:
                .chordG
        case .C:
                .chordC
        case .Dm:
                .chordDm
        case .Am:
                .chordAm
        }
    }
}

#Preview {
    Level6View()
}
