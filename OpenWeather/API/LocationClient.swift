//
//  LocationClient.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public protocol LocationClientProtocol {
    
    func getLocations(ids: [String]?, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?)
    func getLocations(request: LocationClient.GroupRequest, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?)
    
    func findLocation(query: String?, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?)
    func findLocation(request: LocationClient.LocationsRequest, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?)
    
    func getDetail(locationId: String?, onCompletion: HttpCompletionClosure<LocationClient.DetailResponse>?)
    func getDetail(request: LocationClient.DetailRequest, onCompletion: HttpCompletionClosure<LocationClient.DetailResponse>?)
}

public class LocationClient: HttpClient, LocationClientProtocol {
    
    public func findLocation(query: String?, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?) {
        
        let request = LocationsRequest(query: query, appId: self.appKey, units: "metric")
        
        self.findLocation(request: request, onCompletion: onCompletion)
    }
    
    public func findLocation(request: LocationClient.LocationsRequest, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?) {

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
        
        let request = DetailRequest(locationId: locationId, appId: self.appKey, units: "metric")
        
        self.getDetail(request: request, onCompletion: onCompletion)
    }
    
    public func getDetail(request: LocationClient.DetailRequest, onCompletion: HttpCompletionClosure<LocationClient.DetailResponse>?) {
        
        let requestString = "/weather\(request.parameters)"

        self.request(
            LocationClient.DetailResponse.self,
            endpoint: requestString,
            httpMethod: .get,
            headers: nil,
            onCompletion: onCompletion
        )
    }
    
    public func getLocations(ids: [String]?, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?) {
        
        let request = GroupRequest(ids: ids, appId: self.appKey, units: "metric")
        
        self.getLocations(request: request, onCompletion: onCompletion)
    }
    
    public func getLocations(request: LocationClient.GroupRequest, onCompletion: HttpCompletionClosure<LocationClient.LocationsResponse>?) {
        
        let requestString = "/group\(request.parameters)"

        self.request(
            LocationClient.LocationsResponse.self,
            endpoint: requestString,
            httpMethod: .get,
            headers: nil,
            onCompletion: onCompletion
        )
    }
}
