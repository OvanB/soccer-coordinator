//: Playground - noun: a place where people can play

import UIKit

/// Store team names and start dates
let teamInfo = [
    ("Dragons", "March 17, 1pm"),
    ("Sharks",  "March 17, 3pm"),
    ("Raptors", "March 18, 1pm")
]
let numTeams = teamInfo.count

/// Initial idea: store players in array of tuples --> is this allowed?

//var playersTuples: [(name: String, height: Int, experienced: Bool, guardians: String)] =
//[
//("Joe Smith",           42, true,  "Jim and Jan Smith"),
//("Jill Tanner",         36, true,  "Clara Tanner"),
//("Bill Bon",            43, true,  "Sara and Jenny Bon"),
//("Eva Gordon",          45, false, "Wendy and Mike Gordon"),
//("Matt Gill",           40, false, "Charles and Sylvia Gill"),
//("Kimmy Stein",         41, false, "Bill and Hillary Stein"),
//("Sammy Adams",         45, false, "Jeff Adams"),
//("Karl Saygan",         42, true,  "Heather Bledsoe"),
//("Suzane Greenberg",    44, true,  "Henrietta Dumas"),
//("Sal Dali",            41, false, "Gala Dali"),
//("Joe Kavalier",        39, false, "Sam and Elaine Kavalier"),
//("Ben Finkelstein",     44, false, "Aaron and Jill Finkelstein"),
//("Diego Soto",          41, true,  "Robin and Sarika Soto"),
//("Chloe Alaska",        47, false, "David and Jamie Alaska"),
//("Arnold Willis",       43, false, "Claire Willis"),
//("Phillip Helm",        44, true,  "Thomas Helm and Eva Jones"),
//("Les Clay",            42, true,  "Wynonna Brown"),
//("Herschel Krustofski", 45, true,  "Hyman and Rachel Krustofski"),
//]

/// Store players in array of dictionaries
let players: [[String: Any]] =
    [
        ["name": "Joe Smith",           "height": 42, "experienced": true,  "guardians": "Jim and Jan Smith"],
        ["name": "Jill Tanner",         "height": 36, "experienced": true,  "guardians": "Clara Tanner"],
        ["name": "Bill Bon",            "height": 43, "experienced": true,  "guardians": "Sara and Jenny Bon"],
        ["name": "Eva Gordon",          "height": 45, "experienced": false, "guardians": "Wendy and Mike Gordon"],
        ["name": "Matt Gill",           "height": 40, "experienced": false, "guardians": "Charles and Sylvia Gill"],
        ["name": "Kimmy Stein",         "height": 41, "experienced": false, "guardians": "Bill and Hillary Stein"],
        ["name": "Sammy Adams",         "height": 45, "experienced": false, "guardians": "Jeff Adams"],
        ["name": "Karl Saygan",         "height": 42, "experienced": true,  "guardians": "Heather Bledsoe"],
        ["name": "Suzane Greenberg",    "height": 44, "experienced": true,  "guardians": "Henrietta Dumas"],
        ["name": "Sal Dali",            "height": 41, "experienced": false, "guardians": "Gala Dali"],
        ["name": "Joe Kavalier",        "height": 39, "experienced": false, "guardians": "Sam and Elaine Kavalier"],
        ["name": "Ben Finkelstein",     "height": 44, "experienced": false, "guardians": "Aaron and Jill Finkelstein"],
        ["name": "Diego Soto",          "height": 41, "experienced": true,  "guardians": "Robin and Sarika Soto"],
        ["name": "Chloe Alaska",        "height": 47, "experienced": false, "guardians": "David and Jamie Alaska"],
        ["name": "Arnold Willis",       "height": 43, "experienced": false, "guardians": "Claire Willis"],
        ["name": "Phillip Helm",        "height": 44, "experienced": true,  "guardians": "Thomas Helm and Eva Jones"],
        ["name": "Les Clay",            "height": 42, "experienced": true,  "guardians": "Wynonna Brown"],
        ["name": "Herschel Krustofski", "height": 45, "experienced": true,  "guardians": "Hyman and Rachel Krustofski"],
    ]

/// Store number of players & teams for easy access
let totalPlayers = players.count

/// Order the players by experience, then by height
let playersSorted = players.sorted {
    item1, item2 in
        let exp1 = item1["experienced"] as! Bool
        let exp2 = item2["experienced"] as! Bool
        let hgt1 = item1["height"] as! Int
        let hgt2 = item2["height"] as! Int

    // Sort by 'experienced' first:
    // If both sides are different, return the left-hand side
    // so that an unexperienced one would return false and gets
    // sorted
    if (exp1 != exp2) {
        return exp1
    }
    else {
        // Both sides have the same experience, so sort
        // them on height now, in ascending order
        return hgt1 < hgt2
    }
}
debugPrint(playersSorted)

/// Let's add each team to an array
var teams = [ [[String: Any]] ]()
for i in 1...numTeams {
    teams.append([[String: Any]]())
}

/// Spread the players evenly amongst the teams
for (index, player) in playersSorted.enumerated() {
    teams[index % numTeams].append(player)
}

/// Function to calculate the average height of a team
func average(forTeam team: Int) -> Double {
    var total = 0
    for player in teams[team] {
        total += player["height"] as! Int
    }
    let teamPlayers = teams[team].count
    let average = Double(total) / Double(teamPlayers)
    return average
}

/// Output averages of the teams
for i in 0..<numTeams {
    print("Team \(teamInfo[i].0) average is \(average(forTeam: i))")
}

/// Todo: adjust players if averages of team are not within 1.5 inches of other teams
func balanceTeams() {
    
}

/// Create letters to all players & their guardians
var letters = [String]()
for (index, team) in teams.enumerated() {
    for player in team {
        var letter = "Dear \(player["guardians"]!), \(player["name"]!),\nCongratulations! You've been selected for the \(teamInfo[index].0)!\n"
        letter += "Your first practice is on \(teamInfo[index].1) — you don't want to be late!\n—Team \(teamInfo[index].0)\n"
        letters.append(letter)
    }
}
print(letters)

