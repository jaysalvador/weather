//
//  LocationClient.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public protocol LocationClientProtocol {
    
    func getLocations(query: String?, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?)
    func getLocations(request: LocationClient.LocationsRequest, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?)
    
    func getDetail(locationId: String?, onCompletion: HttpCompletionClosure<LocationClient.DetailResponse>?)
    func getDetail(request: LocationClient.DetailRequest, onCompletion: HttpCompletionClosure<LocationClient.DetailResponse>?)
}

public class LocationClient: HttpClient, LocationClientProtocol {
    
    public func getLocations(query: String?, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?) {
        
        let request = LocationsRequest(query: query, appId: self.appKey)
        
        self.getLocations(request: request, onCompletion: onCompletion)
    }
    
    public func getLocations(request: LocationClient.LocationsRequest, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?) {

        let requestString = "/find\(request.parameters)"

        self.request(
            LocationClient.LocationsResponse.self,
            endpoint: requestString,
            httpMethod: .get,
            headers: nil,
            onCompletion: onCompletion
        )
    }
    
    public func getDetail(locationId: String?, onCompletion: HttpCompletionClosure<LocationClient.DetailResponse>?) {
        
        let request = DetailRequest(locationId: locationId, appId: self.appKey)
        
        self.getDetail(request: request, onCompletion: onCompletion)
    }
    
    public func getDetail(request: LocationClient.DetailRequest, onCompletion: HttpCompletionClosure<LocationClient.DetailResponse>?) {
        
        let requestString = "/find\(request.parameters)"

        self.request(
            LocationClient.DetailResponse.self,
            endpoint: requestString,
            httpMethod: .get,
            headers: nil,
            onCompletion: onCompletion
        )
    }
}
