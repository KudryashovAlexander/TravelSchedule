import OpenAPIRuntime
import Foundation
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations
typealias NearestCity = Components.Schemas.City
typealias CarrierInformation = Components.Schemas.Carriers
typealias ScheduleBetweenStations = Components.Schemas.ScheduleBetweenStations
typealias ScheduleStation = Components.Schemas.ScheduleStation
typealias RouteStations = Components.Schemas.RouteStations
typealias StationsList = Components.Schemas.StationsList
typealias Copyright = Components.Schemas.Copyright

fileprivate let APIKey = "d37fd47c-1133-4d19-93c0-3dda0dee0237"

protocol NearestStationsServiceProtocol {
    func getScheduleBetweenStations(from: String, to: String) async throws -> ScheduleBetweenStations
    func getScheduleStation(station: String) async throws -> ScheduleStation
    func getRouteStations(uid: String) async throws -> RouteStations
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getNearestCity(lat: Double, lng: Double, distance: Int) async throws -> NearestCity
    func getCarriersInformation(code: String) async throws -> CarrierInformation
    func getStationsList() async throws -> StationsList
    func getCopyRight() async throws -> Copyright
}

final class NearestStationsService: NearestStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String = APIKey) {
        self.client = client
        self.apikey = apikey
    }
  
    // Расписание между станциями
    func getScheduleBetweenStations(from: String, to: String) async throws -> ScheduleBetweenStations {
        let responce = try await client.getScheduleBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to))
        return try responce.ok.body.json
    }
    
    // Расписание станции
    func getScheduleStation(station: String) async throws -> ScheduleStation {
        let responce = try await client.getScheduleStation(query: .init(
            apikey: apikey,
            station: station))
        return try responce.ok.body.json
    }
    
    // Список станций следования
    func getRouteStations(uid: String) async throws -> RouteStations {
        let responce = try await client.getRouteStations(query: .init(
            apikey: apikey,
            uid: uid))
        return try responce.ok.body.json
    }

    // Ближайшие станции
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
    
    // Ближайший город
    func getNearestCity(lat: Double, lng: Double, distance: Int) async throws -> NearestCity {
        let response = try await client.getNearestCity(query: .init(
          apikey: apikey,
          lat: lat,
          lng: lng,
          distance: distance
        ))
        return try response.ok.body.json
    }
    
    // Информация о перевозчике
    func getCarriersInformation(code: String) async throws -> CarrierInformation {
        let responce = try await client.getСarrierInformation(query: .init(
            apikey: apikey,
            code: code))
        return try responce.ok.body.json
    }
    
    // Список станций
    func getStationsList() async throws -> StationsList {
        let responce = try await client.getStationsList(query: .init(
            apikey: apikey,
            format: .json))
        let html = try responce.ok.body.html
        let data = try await Data(collecting: html, upTo: 1024*1024*50)
        print(data)
        let allStations = try JSONDecoder().decode(StationsList.self, from: data)
        return allStations
    }
    
    // Копирайт
    func getCopyRight() async throws -> Copyright {
        let responce = try await client.copyright(query: .init(apikey: apikey))
        return try responce.ok.body.json
    }
    
}
