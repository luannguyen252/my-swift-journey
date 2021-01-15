//
//  CurrencyRateTests.swift
//  CurrencyConverterTests
//
//  Created by Vincent Smithers on 12.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import XCTest
@testable import CurrencyConverter

class CurrencyRateTests: XCTestCase {
    
    func testCurrencyZeroRates() {
        let currencyRates = currencies.map({ ExchangeRate(currency: $0, baseCurrency: Currency(currencyCode: "USD"), rate: Decimal(0))})
        currencyRates.forEach({
            XCTAssertNotNil($0.currency)
            XCTAssertNotNil($0.rate)
            XCTAssertNotNil($0.formattedRate)
            XCTAssertTrue(
                $0.formattedRate.contains("0.00")
                || $0.formattedRate.contains("0,00")
            )
        })
    }
    
    func testSingleUnitRate() {
        let currencyRates = currencies.map({ ExchangeRate(currency: $0, baseCurrency: Currency(currencyCode: "USD"), rate: Decimal(1.00))})
        currencyRates.forEach({
            switch $0.currency.code {
            case "GBP":
                XCTAssertEqual($0.formattedRate, "£1.00")
            case "SEK":
                XCTAssertEqual($0.formattedRate, "1,00 kr")
            case "DKK":
                XCTAssertEqual($0.formattedRate, "1,00 kr.")
            case "PLN":
                XCTAssertEqual($0.formattedRate, "1,00 PLN")
            case "EUR":
                XCTAssertEqual($0.formattedRate, "€1.00")
            case "NOK":
                XCTAssertEqual($0.formattedRate, "NOK 1,00")
            case "HUF":
                XCTAssertEqual($0.formattedRate, "1,00 HUF")
            case "CZK":
                XCTAssertEqual($0.formattedRate, "1,00 CZK")
            case "USD":
                XCTAssertEqual($0.formattedRate, "$1.00")
            case "SGD":
                XCTAssertEqual($0.formattedRate, "$1.00")
            case "HKD":
                XCTAssertEqual($0.formattedRate, "HK$1.00")
            default: break
            }
        })
    }
    
    func testHundredsUnitRate() {
        let currencyRates = currencies.map({ ExchangeRate(currency: $0, baseCurrency: Currency(currencyCode: "USD"), rate: Decimal(666.00))})
        currencyRates.forEach({
            switch $0.currency.code {
            case "GBP":
                XCTAssertEqual($0.formattedRate, "£666.00")
            case "SEK":
                XCTAssertEqual($0.formattedRate, "666,00 kr")
            case "DKK":
                XCTAssertEqual($0.formattedRate, "666,00 kr.")
            case "PLN":
                XCTAssertEqual($0.formattedRate, "666,00 PLN")
            case "EUR":
                XCTAssertEqual($0.formattedRate, "€666.00")
            case "NOK":
                XCTAssertEqual($0.formattedRate, "NOK 666,00")
            case "HUF":
                XCTAssertEqual($0.formattedRate, "666,00 HUF")
            case "CZK":
                XCTAssertEqual($0.formattedRate, "666,00 CZK")
            case "USD":
                XCTAssertEqual($0.formattedRate, "$666.00")
            case "SGD":
                XCTAssertEqual($0.formattedRate, "$666.00")
            case "HKD":
                XCTAssertEqual($0.formattedRate, "HK$666.00")
            default: break
            }
        })
    }
}
