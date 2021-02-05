//
//  ContentView.swift
//  DemoCoreData
//
//  Created by RyoNishimura on 2020/09/11.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    // managedObjectContext(管理オブジェクトが登録されているコンテキスト)にアクセスする宣言
    @Environment(\.managedObjectContext) var managedObjectContext
    // 1.プロパティラッパーを使用してプロパティを宣言。これにより、結果を直接使用することができる
    @FetchRequest(
      // 2.CoreDataがfetchするEntityを指定。
      entity: Sample.entity(),
      // 3.「タイトル」でソート(データ内容をここで確定させる)
      sortDescriptors: [
        NSSortDescriptor(keyPath: \Sample.inPutNum, ascending: true)
      ]
      /*
       特定の情報を取得したい時だけ、述語を追加する

       ,predicate: NSPredicate(format: "genre contains 'Action'")

       これを追加すれば結果を制限することができる
       */
      // 4.FetchedResults（フェッチ要求の実行結果）を継承する"samples"を宣言
    ) var samples: FetchedResults<Sample>
    
    @State var keyPut = ""
    var body: some View {
        VStack {
            TextField("プレースホルダー", text: $keyPut,
                      // エンターが押された
                      onCommit: {
                        // 新しいオブジェクトコンテキストを作成
                        let newSample = Sample(context: self.managedObjectContext)
                        // パラメーターとして渡されるプロパティの設定
                        newSample.inPutNum = self.keyPut
                        // AppDelegateを継承する
                        let appDelegate:AppDelegate  = UIApplication.shared.delegate as! AppDelegate
                        // 管理オブジェクトコンテキストを保存する
                        appDelegate.saveContext()
                        self.keyPut = ""
            })
            List {
                ForEach(samples, id: \.inPutNum) {
                    Text("\($0)")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
