//
//  ViewController.swift
//  Practice_WeatherApp
//
//  Created by kingj on 4/18/25.
//

import UIKit
import SnapKit
import Alamofire

final class ViewController: UIViewController {
    
    private var dataSource = [ForcastWeather]()
    
    // URL 쿼리 아이템들.
    // 서울역 위경도.
    private let urlQueryItems: [URLQueryItem] = [
        URLQueryItem(name: "lat", value: "37.5"),
        URLQueryItem(name: "lon", value: "126.9"),
        URLQueryItem(name: "appid", value: "6bd8d4bcef033d98ae4d970ff198b842"),
        URLQueryItem(name: "units", value: "metric"),
    ]
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = "서울특별시"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "20도"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 50)
        return label
    }()
    
    private let tempMinLabel: UILabel = {
        let label = UILabel()
        label.text = "20도"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let tempMaxLabel: UILabel = {
        let label = UILabel()
        label.text = "20도"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let tempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.backgroundColor = .black
        return imageview
    }()
    
    // 1. delegate
    // 2. dataSource
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        
        // tableView에 tableView Cell 등록
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchCurrentWeatherData()
        fetchForcastWeatherData()
    }
    
    // 🔴 서버 데이터를 불러오는 메서드.
    // <T: Decodable>: Decodable Type만 준수하는 어떠한 타입이든 상관없이 들어올 수 있다.
    // completion: 성공시; Decoding된 데이터, 실패시; nil
    private func fetchData<T: Decodable>(url: URL, completion: @escaping (T?) -> Void) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data, error == nil else {
                print("데이터 로드 실패")
                completion(nil)
                return
            }
            
            let successRange: Range = 200..<300
            
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                // Decoding
                // T.self: 가능한 이유는, <T: Decodable> 에서 T가 Decodable타입임을 확신해줬기 때문
                guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                    print("JSON 디코딩 실패")
                    completion(nil)
                    return
                }
                completion(decodedData)
            } else {
                print("응답 오류")
                completion(nil)
            }
        }.resume()
    }
    
    // 🔴 Alamofire를 사용해서 서버 데이터를 불러오는 메서드.
    // 성공하면 T타입으로 결과 return, 실패하면 AFError타입으로 결과 return
    private func fetchDataByAlamofire<T: Decodable>(url: URL, completion: @escaping (Result<T, AFError>) -> Void) {
        
        // 들어온 url 넣고,
        // responseDecodable까지 해주면, 들어온 request에 대한 응답에 decoding까지 함께 하게 된다.
        // T.self : T type으로 decoding하겠다.
        AF.request(url).responseDecodable(of: T.self) { response in
            completion(response.result) // .result까지 해줘야, T 타입이 나오게 된다.
        }
    }
    
    // 서버에서 날씨 예보 데이터를 불러오는 메소드.
    private func fetchForcastWeatherData() {
        var urlComponents = URLComponents(string:  "https://api.openweathermap.org/data/2.5/forecast")
        
        urlComponents?.queryItems = self.urlQueryItems
        
        guard let url = urlComponents?.url else {
            print("잘못된 URL 2")
            return
        }
        
        // Networking시, 데이터를 받아서 디코딩하기 위한 데이터 타입도 Result 결과로 받아서 오라고 보내주는것
        fetchDataByAlamofire(url: url) { [weak self] (result: Result<ForecastWeatherResult, AFError>) in
            guard let self else { return }
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.dataSource = result.list
                    self.tableView.reloadData() // ⭐️
                }
                
            case .failure(let error):
                print("데이터 로드 실패: \(error)")
            }
        }
        
        /*
        fetchData(url: url) { [weak self] (result: ForecastWeatherResult?) in
            guard let self, let result else { return }
            
            for forcaseWeather in result.list {
                print("forcaseWeather: \n \(forcaseWeather.main) \n \(forcaseWeather.dtTxt)")
            }
            
            DispatchQueue.main.async {
                self.dataSource = result.list
                self.tableView.reloadData() // ⭐️
            }
        }
         */
    }
    
    // 서버에서 현재 날씨 데이터를 불러오는 메서드.
    private func fetchCurrentWeatherData() {
        var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
        
        // queryItems: queryItems 속성으로 urlComponents 뒤에 ? & 로 알아서 들어가게 됨
        urlComponents?.queryItems = self.urlQueryItems
        
        // urlComponents로 부터 url을 뽑아낼 수 있다
        guard let url = urlComponents?.url else {
            print("잘못된 URL")
            return
        }
        
        // result 매개변수 이름으로 결과를 받게됨
        fetchDataByAlamofire(url: url) { [weak self] (result: Result<CurrentWeatherResult, AFError>) in
            guard let self else { return }
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.tempLabel.text = "\(Int(result.main.temp))℃"
                    self.tempMinLabel.text = "최소: \(Int(result.main.tempMin))℃"
                    self.tempMaxLabel.text = "최대: \(Int(result.main.tempMax))℃"
                }
                
                guard let imageUrl = URL(string: "https://openweathermap.org/img/wn/\(result.weather[0].icon)@2x.png") else {
                    return
                }
                
                // Alamofire를 사용한 이미지 로드
                // 기본적으로 background thread에서 돌아가기 때문에, main thread에서 UI 작업을 해준다.
                AF.request(imageUrl).responseData { response in
                    if let data = response.data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            case .failure(let error):
                print("데이터 로드 실패: \(error)")
            }
        }
        
        // 'resultData: '로 @escaping (T?)의 T 타입으로 인식되어, 결과를 받게됨
        // Server데이터를 불러오는 작업은, background thread에서 작업된다.
        //. >> 운영체제 깊게 공부해보기
        // 스레드?
        //. 작업을 처리하는 기본단위이다.
        //. 하나의 앱이 실행 될때, 여러개의 스레드가 병행해서 각자의 작업을 한다.
        //. 스레드는 1. main thread, 2. background thread 로 나눌 수 있다.
        //. UI 작업 : 반드시 main thread
        //. Server데이터를 불러오는 작업 : background thread
        
        // 이 메소드는 Server데이터를 불러오는 작업이니 >> background thread 작업됨
        /*
        fetchData(url: url) { [weak self] (resultData: CurrentWeatherResult?) in
            guard let self, let resultData else { return }
            
            // 이 메소드는 background thread 작업되는 메소드이니,
            // self.tempLabel과 같은 UI 업데이트는, main thread 에서 작업하라고 명시해주기
            //  = DispatchQueue.main.async
            // 명시해주지 않으면 background thread 에서 작업되니 -> 에러남
            DispatchQueue.main.async {
                self.tempLabel.text = "\(Int(resultData.main.temp))℃"
                self.tempMinLabel.text = "최소: \(Int(resultData.main.tempMin))℃"
                self.tempMaxLabel.text = "최대: \(Int(resultData.main.tempMax))℃"
            }
            
            guard let imageUrl = URL(string: "https://openweathermap.org/img/wn/\(resultData.weather[0].icon)@2x.png") else {
                return
            }
            
            // image를 로드하는 작업또한 백그라운드 스레드 작업이다.
            // Data(contentsOf: imageUrl): URL에 해당하는 이미지 데이터가 로드 됨
            if let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    // 그러나, 아래 코드인 UI 업데이트 작업은, main thread 작업!
                    //  => 따라서, DispatchQueue.main.async 사용할것
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }*/
        
        
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        [
            titleLable,
            tempLabel,
            tempStackView,
            imageView,
            tableView
        ].forEach { view.addSubview($0) }
        
        [
            tempMinLabel,
            tempMaxLabel
        ].forEach { tempStackView.addArrangedSubview($0) }
        
        titleLable.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
        }
        
        tempLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLable.snp.bottom).offset(10)
        }
        
        tempStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tempLabel.snp.bottom).offset(10)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(160)
            $0.top.equalTo(tempStackView.snp.bottom).offset(20)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

extension ViewController: UITableViewDelegate {
    // TableView cell 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension ViewController: UITableViewDataSource {
    // TableView 섹션에 행이 몇 개 들어가는가.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    // TableView의 indexPath마다 TableView 셀을 지정
    // indexPath = TableView의 row, section을 의미
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeueReusableCell
        // UITableView는 여러개의 셀을 갖고있다.
        // 예를들어, 1000개의 셀을 갖고있다. 그러면 실제로 1000개의 셀을 다 만드는게 아니다.
        // 실세로는 화면에 보이는 만큼만 셀을 만든다. >> 최적화를 위해
        // 스크롤을 해서 보여진 셀이 안보이게 되면, 만들어진 셀을 파괴하고, 셀을 재사용하여 스크롤된 위치로 갈아 끼운다.
        // 그래서, 이름이 재사용셀(ReusableCell) 이 된 것이다.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else { return UITableViewCell() }
        cell.configureCell(forcaseWeather: self.dataSource[indexPath.row])
        return cell
    }
}
