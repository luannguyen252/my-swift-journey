//
//  CTHelpBuilder.swift
//  MyBooks
//
//  Created by Stewart Lynch on 2020-08-31.
//

import UIKit
import CTHelp

enum CTHelpBuilder {
    enum Page {
        case contentView
        case bookDetail
        case newBook
    }
    
    static func getHelpItems(page: Page) -> CTHelp {
        let ctHelp = CTHelp()
        let myCTStrings = CTString()
        myCTStrings.contactTitle = "Bug Report"
        myCTStrings.contactHelpText = "Please help us to improve this application by submitting your bug report."
        ctHelp.ctString = myCTStrings
        
        let myCTColors = CTColors()
        myCTColors.titleColor = UIColor(named: "HelpPrimaryColor")
        myCTColors.helpTextColor = UIColor(named: "HelpPrimaryColor")
        ctHelp.ctColors = myCTColors
        
        ctHelp.height = 500
        switch page {
        case .contentView:
            ctHelp.new(CTHelpItem(title: "My Books",
                                  helpText: "",
                                  imageName: "MyBooksLogo"))
            ctHelp.new(CTHelpItem(title: "List of Books",
                                  helpText: """
                        This screen shows a list of all books that you have read.
                        As you read more books you can add to this list.
                        You can also remove books from the list as well.  See other help screens for more information
                        """,
                                  imageName: ""))
            ctHelp.new(CTHelpItem(title: "Adding a Book",
                                  helpText: """
                        To add a book to your collection, tap on the '+' button on the navigation bar to be taken to the add screen.
                        """,
                                  imageName: "AddPlus"))
        case .bookDetail:
            ctHelp.new(CTHelpItem(title: "Book Detail",
                                  helpText: """
                        Update entry by  typing new information and then tap the back button
                        """,
                                  imageName: "BookDetail"))
        case .newBook:
            ctHelp.new(CTHelpItem(title: "New Book",
                                  helpText: """
                        Enter an author and title for your book.
                        Optionally, enter notes for the book too.
                        Tap on the 'Add Book' button to add to yur list.
                        """,
                                  imageName: "AddBook"))
        }
        let books = BooksViewModel.retrieveBooks()
        let encoder = JSONEncoder()
        guard let bookData = try? encoder.encode(books) else {
            fatalError("Unable to encode data")
        }
        
        ctHelp.appendDefaults(companyName: "CreaTECH Solutions",
                              emailAddress: "books@createchsol.com",
                              data: bookData,
                              webSite: "https://www.createchsol.com",
                              companyImageName: "CreaTECH")
        return ctHelp
    }
}
