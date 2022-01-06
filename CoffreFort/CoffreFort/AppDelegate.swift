//
//  AppDelegate.swift
//  CoffreFort
//
//  Created by Clement Combier on 22/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private static var collectionSites: [Site] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppDelegate.collectionSites = Site.valoriserTousLesSites()
        print(AppDelegate.collectionSites.count)
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    //Méthode pour la classe Site et le tableau collectionSite
    public static func ajoute(_ unSite : Site){
        var collectionSite = getCollectionSites() //On récupère la collection actuelle
        collectionSite.append(unSite) //On ajoute le site
        setCollectionSites(collectionSite) //On set la nouvelle collection
    }
    
    public static func getCollectionSites() -> [Site] {
        return self.collectionSites
    }
    public static func setCollectionSites(_ nouvelleCollection : [Site]){
        self.collectionSites = nouvelleCollection
    }
}

