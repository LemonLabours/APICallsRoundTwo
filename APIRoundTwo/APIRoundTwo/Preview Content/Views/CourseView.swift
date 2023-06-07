
import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(.gray)
            
            
        }
        else{
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _
            in
            self.data = data
        }
        task.resume()
    }
}

struct CourseView: View {
    @StateObject var viewModel = CourseViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id : \.self) {course in
                    HStack {
                        URLImage(urlString: course.image)
                        
                        Text(course.name)
                            .bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
