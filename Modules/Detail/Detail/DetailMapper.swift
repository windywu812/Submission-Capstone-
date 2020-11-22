//
//  MovieMapper.swift
//  Detail
//
//  Created by Windy on 20/11/20.
//

import Foundation
import Core
import Common

public struct DetailMapper: GenericMapper {
    
    public typealias Response = DetailResponse
    public typealias Entity = DetailEntity
    public typealias Domain = DetailModel
    
    public static func mapResponseToEntity(response: DetailResponse) -> DetailEntity {
        return DetailEntity(
            idMovie: response.idMovie,
            title: response.title,
            tagline: (response.tagline?.isEmpty == true ? "No tagline" : response.tagline) ?? "",
            overview: response.overview ?? "No overview",
            popularity: response.popularity,
            releaseDate: response.releaseDate,
            backdropPath: "\(API.imageLoaderURL)\(response.backdropPath ?? "")",
            status: response.status,
            voteAverage: response.voteAverage,
            voteCount: response.voteCount,
            spokenLanguages: response.spokenLanguages.map({ return $0.name }),
            productionCompanies: response.productionCompanies.map({ return $0.name }),
            genres: response.genres.map({ return $0.name }),
            runtime: response.runtime,
            posterPath: response.posterPath)
    }
    
    public static func mapEntityToDomain(entity: DetailEntity) -> DetailModel {
        return DetailModel(
            idMovie: entity.idMovie,
            title: entity.title,
            tagline: entity.tagline,
            overview: entity.overview,
            popularity: entity.popularity,
            releaseDate: entity.releaseDate,
            backdropPath: entity.backdropPath,
            status: entity.status,
            voteAverage: entity.voteAverage,
            voteCount: entity.voteCount,
            spokenLanguages: entity.spokenLanguages,
            productionCompanies: entity.productionCompanies,
            genres: entity.genres,
            runtime: entity.runtime,
            posterPath: entity.posterPath)
    }
    
    public static func mapDomainToEntity(model: DetailModel) -> DetailEntity {
        return DetailEntity(
            idMovie: model.idMovie,
            title: model.title,
            tagline: model.tagline,
            overview: model.overview,
            popularity: model.popularity,
            releaseDate: model.releaseDate,
            backdropPath: model.backdropPath,
            status: model.status,
            voteAverage: model.voteAverage,
            voteCount: model.voteCount,
            spokenLanguages: model.spokenLanguages,
            productionCompanies: model.productionCompanies,
            genres: model.genres,
            runtime: model.runtime,
            posterPath: model.posterPath)
    }
    
    public static func mapEntityToResponse(model: DetailEntity) -> DetailResponse {
        return DetailResponse(
            idMovie: model.idMovie,
            title: model.title,
            tagline: "",
            overview: model.overview,
            popularity: model.popularity,
            releaseDate: model.releaseDate,
            backdropPath: "",
            status: "",
            voteAverage: 0,
            voteCount: 0,
            spokenLanguages: [],
            productionCompanies: [],
            genres: [],
            runtime: 0,
            posterPath: model.posterPath)
    }
    
}
