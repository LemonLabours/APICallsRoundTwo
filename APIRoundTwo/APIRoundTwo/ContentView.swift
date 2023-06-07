import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    NavigationLink(destination: CarView()) {
                        RectangleButton(label: "Car View")
                    }
                    
                    NavigationLink(destination: DadJokesView()) {
                        RectangleButton(label: "Dad Jokes View")
                    }
                    
                    NavigationLink(destination: BucketListView()) {
                        RectangleButton(label: "Bucket List View")
                    }
                    
                    NavigationLink(destination: TriviaView()) {
                        RectangleButton(label: "Trivia View")
                    }
                    
                    NavigationLink(destination: PlanetView()) {
                        RectangleButton(label: "Planet View")
                    }
                    
                    
                    NavigationLink(destination: CourseView()) {
                        RectangleButton(label: "Course View")
                    }
                
                    NavigationLink(destination: QuotesView()) {
                        RectangleButton(label: "Quote View")
                    }
                    
                    NavigationLink(destination: BabyNamesView()) {
                        RectangleButton(label: "BabyNames View")
                    }
             
                    
                    NavigationLink(destination: CanadaMuslimHolidaysView()) {
                        RectangleButton(label: "CanadaMuslimHolidays View")
                    }
                    
                    NavigationLink(destination: RandomWordView()) {
                        RectangleButton(label: "RandomWord View")
                    }
                    
                    NavigationLink(destination: PostsView()) {
                        RectangleButton(label: "Posts View")
                    }
             
                    
        
                    
                }
                .padding()
            }
            .navigationBarTitle("Button Grid")
        }
    }
}

struct RectangleButton: View {
    let label: String
    
    var body: some View {
        Text(label)
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
