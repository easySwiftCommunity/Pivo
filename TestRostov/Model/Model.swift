//
//  Model.swift
//  TestRostov
//
//  Created by mac on 06.07.2022.
//

import UIKit

// MARK: - PivoElement
struct PivoElement: Codable {
    let id: Int?
    let name, tagline, firstBrewed, pivoDescription: String?
    let imageURL: String?
    let abv: Double?
    let ibu, targetFg: Int?
    let targetOg: Double?
    let ebc, srm: Double?
    let ph, attenuationLevel: Double?
    let volume, boilVolume: BoilVolume?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: ContributedBy?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case pivoDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

// MARK: - BoilVolume
struct BoilVolume: Codable {
    let value: Double?
    let unit: Unit?
}

enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
}

enum ContributedBy: String, Codable {
    case aliSkinnerAliSKinner = "Ali Skinner <Ali SKinner>"
    case aliSkinnerAliSkinner = "Ali Skinner <AliSkinner>"
    case iainMullanIainmullan = "Iain Mullan <iainmullan>"
    case mattBallGeordieMatt = "Matt Ball <GeordieMatt>"
    case samMasonSamjbmason = "Sam Mason <samjbmason>"
    case sashaSashaMasondeCaires = "Sasha <SashaMasondeCaires>"
}

// MARK: - Ingredients
struct Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
}

// MARK: - Hop
struct Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add: Add?
    let attribute: Attribute?
}

enum Add: String, Codable {
    case dryHop = "dry hop"
    case end = "end"
    case fv = "FV"
    case middle = "middle"
    case start = "start"
}

enum Attribute: String, Codable {
    case aroma = "aroma"
    case bitter = "bitter"
    case flavour = "flavour"
    case twist = "twist"
}

// MARK: - Malt
struct Malt: Codable {
    let name: String?
    let amount: BoilVolume?
}

// MARK: - Method
struct Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}

// MARK: - Fermentation
struct Fermentation: Codable {
    let temp: BoilVolume?
}

// MARK: - MashTemp
struct MashTemp: Codable {
    let temp: BoilVolume?
    let duration: Int?
}

typealias Pivo = [PivoElement]
