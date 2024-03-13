//
//  TestNetworkService.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 11.03.2024.
//

import Foundation
import OpenAPIURLSession

final class TestNetworkService {
    
    func getService() throws -> NearestStationsService {
        let client = Client(
            serverURL: try Servers.server1(),
            transport: URLSessionTransport()
        )
        let service = NearestStationsService(client: client)
        return service
    }
    
    // Расписание между станциями
    func scheduleBetweenStations() {
        do {
            let service = try getService()
            Task {
                let schedule = try await service.getScheduleBetweenStations(from: "s9600213", to: "c213")
                print("Расписание между станциями \n\(schedule)")
            }
        } catch {
            print("Не удалось получить расписание между станциями")
        }
    }
    
    // Расписание станции
    func scheduleStation() {
        do {
            let service = try getService()
            Task {
                let schedule = try await service.getScheduleStation(station: "s9600213") //тест
                print("Расписание станции \n\(schedule)")
            }
        } catch {
            print("Не удалось получить Расписание станции")
        }
    }
    
    // Список станций следования
    func routeStations() {
        do {
            let service = try getService()
            Task {
                let schedule = try await service.getRouteStations(uid: "SU-1976_240401_c26_12") // тест
                print("Список станций следования \n\(schedule)")
            }
        } catch {
            print("Не удалось получить Список станций следования")
        }
    }
    
    // Ближайшие станции
    func stations() {
        do {
            let service = try getService()
            Task {
                let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
                print("Ближайшие станции \n\(stations)")
            }
        } catch {
            print("Не удалось получить ближайшие станции")
        }
    }
    
    //ближайший город
    func nearestCity() {
        do {
            let service = try getService()
            Task {
                let city = try await service.getNearestCity(lat: 59.864177, lng: 30.319163, distance: 50)
                print("Ближайший город \n\(city)")
            }
        } catch {
            print("Не удалось получить ближайший город")
        }
    }
    
    //информация о перевозчике
    func carrierInformation() {
        do {
            let service = try getService()
            Task {
                let carrier = try await service.getCarriersInformation(code: "196") //тест код
                print("Информация о перевозчике \n\(carrier)")
            }
        } catch {
            print("Не удалось получить информацию о перевозчике")
        }
    }
    
    // Список станций - 40мб
    func stationsList() {
        do {
            let service = try getService()
            Task {
                do {
                    let stationsList = try await service.getStationsList() //тест код
                    print("Список станций \n\(stationsList)")
                } catch {
                    print("Error decoding")
                }
            }
        } catch {
            print("Не удалось получить Список станций")
        }
    }
    
    // Копирайт
    func copyright() {
        do {
            let service = try getService()
            Task {
                let copyright = try await service.getCopyRight() //тест код
                print("Копирайт \n\(copyright)")
            }
        } catch {
            print("Копирайт")
        }
    }
    
    static let prewiev = TestNetworkService()
}
