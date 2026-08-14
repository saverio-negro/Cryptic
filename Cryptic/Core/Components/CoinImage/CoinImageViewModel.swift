class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    let dataService: any CombineCoinImageDataService
    
    init(dataService: any CombineCoinImageDataService) {
        Task {
            
        }
    }
}