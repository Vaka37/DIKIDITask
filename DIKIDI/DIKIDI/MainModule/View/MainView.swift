//
//  MainView.swift
//  DIKIDI
//
//  Created by Vakil on 19.06.2024.
//

import SwiftUI
/// Главное вью
struct MainView: View {
    var body: some View {
        NavigationView{
            customNavigationView {
                GeometryReader{ gr in
                    Form{
                        Section{
                            categoryView
                        }
                        .frame(width: gr.size.width)
                        .listRowBackground(Color.clear)
                        Section{
                            premiumView
                                .listRowBackground(Color.clear)
                                .padding(.horizontal, 20)
                                .frame(width: gr.size.width)
                            
                            ForEach(mainViewModel.testModel?.primiumData ?? [], id: \.name) { item in
                                PremiumViewCell(icon: item.image.origin, name: item.name, category: "Парикмахерские услуги")
                            }
                        }
                        saleSectionView
                            .padding(.horizontal, 20)
                            .frame(width: gr.size.width)
                            .listRowBackground(Color.clear)
                        
                        exampleView
                            .padding(.horizontal, 20)
                            .frame(width: gr.size.width)
                            .listRowBackground(Color.clear)
                            .padding(.horizontal)
                    }.frame(width: gr.size.width)
                        .listStyle(.plain)
                }
            }
            .gesture(
                DragGesture()
                    .updating($fingerLocation, body: {(value, fingerLocation, _) in
                        fingerLocation = value.location
                        if value.translation.height > 0 {
                            withAnimation {
                                isOffset = false
                            }
                        } else {
                            withAnimation {
                                isOffset = true
                            }
                        }
                    }))
        }
    }
    
    @EnvironmentObject private var mainViewModel: ViewModelMain
    @GestureState private var fingerLocation: CGPoint? = nil
    @State private var isOffset = false
    private var gridItemLayout = [GridItem(.fixed(100), spacing: 15), GridItem(.fixed(100), spacing: 15)]
    
    private var categoryView: some View {
        VStack(alignment: .leading){
            HStack {
                Text("Категории ")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                Text(mainViewModel.testModel?.categoryCount ?? "")
                    .foregroundStyle(.gray)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyHGrid(rows: gridItemLayout) {
                    ForEach(mainViewModel.testModel?.category ?? [], id: \.id){ item in
                        CategoryCell(imageURL: item.image, title: item.name)
                    }
                }
            }
        }.padding(.leading, 20)
    }
    
    private var exampleView: some View {
        LazyVStack(alignment: .leading){
            Text("Примеры работ ")
                .foregroundStyle(.black)
                .fontWeight(.bold)
            AsyncImage(url: URL(string: mainViewModel.testModel?.exampleImage ?? "")){ poster in
                switch poster {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame( height: 200)
                        .cornerRadius(9)
                case .failure(let error):
                    Text(error.localizedDescription)
                }
            }
            Button {} label: {
                HStack{
                    Spacer()
                    Text("Посмотреть фото")
                        .fontWeight(.medium)
                        .padding(7)
                    Spacer()
                }
            } .foregroundStyle(.blue)
                .background(
                    RoundedRectangle(cornerRadius: 7).stroke(Color.blue)
                )
        }
    }
    
    private var saleSectionView: some View {
        Section{
            VStack{
                HStack {
                    Text("Акции ")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                    Text(mainViewModel.testModel?.saleCount ?? "")
                        .foregroundStyle(.gray)
                    Spacer()
                    Button("См. все"){
                        
                    }
                }
                CategoryView(category: mainViewModel.testModel?.sale ?? [])
            }
        }
    }
    
    private var premiumView: some View {
        HStack {
            Text("Премиум")
                .foregroundStyle(.black)
                .fontWeight(.bold)
            Text(mainViewModel.testModel?.premiumCount ?? "")
                .foregroundStyle(.gray)
            Spacer()
        }
    }
    
    private var backgroundNavigation: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.blue.opacity(0.7))
                .ignoresSafeArea()
                .frame(height: isOffset ? 60 : 90)
            VStack{
                Text("Ярославль >")
                    .foregroundStyle(.white)
                    .opacity(isOffset ? 0 : 1)
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Услуга, специалист", text: $mainViewModel.searchBarText)
                    }
                    .padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                            .padding()
                    )
                    Button {
                    } label: {
                        Image(systemName: "mappin.and.ellipse")
                    }
                    .padding(.trailing)
                }
                .offset(y: isOffset ? -30 : 0)
            }
        }
    }
    
    func customNavigationView<Content: View>(content: () -> Content) -> some View {
        VStack {
            backgroundNavigation
            content()
                .offset(y: isOffset ? -30 : 0)
        }
    }
}
