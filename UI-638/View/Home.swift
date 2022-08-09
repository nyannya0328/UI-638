//
//  Home.swift
//  UI-638
//
//  Created by nyannyan0328 on 2022/08/09.
//

import SwiftUI

struct Home: View {
    @State var currentTab : Tab = .home
    @Namespace var animation
    @State var currentIndex : Int = 0
    var body: some View {
        
        VStack{
            
            
            HeaderView()
            
            SearchView()
            
            
            (
            
            Text("Feautured")
                .font(.largeTitle.weight(.light))
                .foregroundColor(.orange)
            + Text(" Movie")
                .font(.caption.weight(.light))
                .foregroundColor(.green)
            
            
            )
              .frame(maxWidth: .infinity,alignment: .leading)
          
            CustomCrousel(index: $currentIndex, items: movies,cardPadding: 150, id: \.id) { movie, cardSize in
                
                
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardSize.width,height: cardSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                
            }
            .padding(.horizontal,-15)
            .padding(.vertical)
            
            TabBar()
            
            
        }
        .padding([.horizontal,.top],15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                TabView(selection: $currentTab) {
                    
                    
                    ForEach(movies.indices,id:\.self){index in
                        
                        Image(movies[index].artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width,height: size.height)
                            .clipped()
                        
                        
                        
                        
                    }
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentTab)
                
                
                Rectangle()
                    .fill(.ultraThickMaterial)
                
                
                LinearGradient(colors: [
                    
                    
                    .clear,
                    Color("BGTop"),
                    Color("BGBottom")
                    
                    
                    
                    
                ], startPoint: .top, endPoint: .bottom)
                
                
            }
            .ignoresSafeArea()
            
            
            
            
        }
        
    }
    @ViewBuilder
    func TabBar()->some View{
        
        HStack(spacing:0){
            
            
            ForEach(Tab.allCases,id:\.rawValue){tab in
                
                VStack(spacing:10){
                    
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30,height: 30)
                    
                    
                    if currentTab == tab{
                        
                        Capsule()
                            .fill(.red)
                            .frame(width: 10,height: 10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    withAnimation(.easeInOut){
                        
                        currentTab = tab
                    }
                }
            }
            
            
        }
        
      
        
        
        
    }
    @ViewBuilder
    func SearchView()->some View{
        
        HStack{
            
            Image("Search")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30,height: 30)
            
            
            TextField("Seach", text: .constant(""))
            
            
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding(.vertical,16)
        .padding(.horizontal)
        .background{
         
            RoundedRectangle(cornerRadius: 30,style: .continuous)
                .fill(.ultraThinMaterial)
        }
        
        
    }
    @ViewBuilder
    func HeaderView()->some View{
        
        HStack{
            
            VStack(alignment: .leading,spacing: 15) {
                
                (
                    
                    Text("Hello") + Text(" NyanNayn")
                    
                )
                .fontWeight(.bold)
                
                
                Text("Book your Favorite movie")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50,height: 50)
                .clipShape(Circle())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
