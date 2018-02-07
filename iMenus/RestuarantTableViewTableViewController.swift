//
//  RestuarantTableViewTableViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 1/23/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class RestuarantTableViewTableViewController: UITableViewController {
    var restaurants=[Restaurants]()
    var valueToPass:Restaurants!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRestuarants()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    private func loadRestuarants()
    {
        let photo1 = UIImage(named: "rest1")
        let photo2 = UIImage(named: "rest2")
        let photo3 = UIImage(named: "rest3")
        let desc1 = "Saffron Grill brings to the Northgate area an inventive fusion of Indian and Mediterranean cuisine served in an inviting atmosphere that encourages you to linger."
        let desc2 = "Traditional Chinese eatery with Taiwanese influences."
        let desc3 = "Bai Tong is the standard for authentic Thai food in the Seattle area."
        let contact1 = "2132 N Northgate Way\nSeattle  WA, 98133\n(206) 417 0707"
        let contact2 = "6969 Coal Creek Pkwy SE\nNewcastle, WA 98059\n(425) 644-5546"
        let contact3 = "14804  NE 24th St.\nRedmond, WA 98052\n(425) 747-8424"
        let dishDesc1 = "Twice cooked pork is a Chinese dish that originates from the Sichuan region of China. The dish is prepared by first simmering pork belly steaks in in water with spices, e.g. slices of ginger, cloves, star anise, jujubes and salt. After refrigeration to firm the meat, it's cut into thin slices and then shallow fried with oil in a wok along with various vegetables. Cooking the pork twice over makes each slice incredibly tender and rich in taste. You can expect the dish to be full of salty and spicy flavors."
        guard let dish1 = Dish(dishName: "Twice Cooked Pork", dishPhoto: #imageLiteral(resourceName: "TwiceCookedPork"), dishDescription: dishDesc1)else {
            fatalError("Unable to instantiate dish")
        }
       
        let dishDesc2="Spring rolls are a large variety of filled, rolled appetizers or dim sum found in East Asian and Southeast Asian cuisine. The name is a literal translation of the Chinese chūn juǎn. This restaurant serves it as mi iature fried rolls with galss noodles and vegetables, served with plum sauce."
        guard let dish2 = Dish(dishName: "Spring Rolls", dishPhoto: #imageLiteral(resourceName: "SpringRolls"), dishDescription: dishDesc2)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc3="Fried wontons are served with a meat filling, (usually pork), and eaten with duck sauce, sweet and sour sauce, or hot mustard. The meat filling is spicy and savoury with a delicious sweet and sour suace"
        guard let dish3 = Dish(dishName: "Fried Wontons", dishPhoto: #imageLiteral(resourceName: "friedWontons"), dishDescription: dishDesc3)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc4="Called Tod Mun Pla in Thai, Thai fish cakes is made with fresh fish paste, long beans, red curry paste and kaffir lime leaves. Each bite of the fish cakes is bursting with briny flavors of the fish, the fragrance and nuance from the red curry paste, and the crunchiness of the long beans. They are absolutely delightful. Served with cucumber sauce and topped with crushed peanuts on the side."
        guard let dish4 = Dish(dishName: "Tod Mun Pla", dishPhoto: #imageLiteral(resourceName: "Tod-Mun-Pla"), dishDescription: dishDesc4)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc5="An abundant platter of fried fish cakes, fried wontons, and miniature fried spring rolls.Served with a sampling of tasty sauces."
        guard let dish5 = Dish(dishName: "Appetizer Plate", dishPhoto: #imageLiteral(resourceName: "appetizer_plate_baitong"), dishDescription: dishDesc5)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc6="Two rolls with freshest of ingredients, wrapped in soft rice skin and cut into four pieces. Stuffed with prawns, barbequed sauce, cilantro, bean sprouts, carrots, lettuce and rice vermicelli, and served with our famous peanut suace topped with ground peanuts. Also available with Tofu. GF."
        guard let dish6 = Dish(dishName: "Fresh Rolls", dishPhoto: #imageLiteral(resourceName: "freshRolls"), dishDescription: dishDesc6)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc7="Crispy fried wontons stuffed with a combination of imitation crab meat and cream cheese. Served with peanut sauce for dipping. Wontons are made by spreading a square wrapper (a dough skin made of flour, egg, water, and salt) flat in the palm of one's hand, placing a small amount of filling in the center, and sealing the wonton into the desired shape by compressing the wrapper's edges together with the fingers."
        guard let dish7 = Dish(dishName: "Crab Wontons", dishPhoto: #imageLiteral(resourceName: "crabWontons"), dishDescription: dishDesc7)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc8="Deep-fried, served with a plum-flavoured sweetchilli dipping sauce and sprinkled with peanuts."
        guard let dish8 = Dish(dishName: "Fried Tofu", dishPhoto: #imageLiteral(resourceName: "friedTofu"), dishDescription: dishDesc8)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc9="Skewered chicken strips are curreid, lathered with coconut milk, and grilled. Served with sides of peanut suace and a cucumber- and- onion mix."
        guard let dish9 = Dish(dishName: "Satay", dishPhoto: #imageLiteral(resourceName: "Satay"), dishDescription: dishDesc9)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc10="Tasty chicken wings aremarinated in a garlic and soy sauce, served with a sweet and sour dipping. It is an unbreaded chicken wing section (flat or drumette) that is generally deep-fried then coated in a sauce consisting of a vinegar-based cayenne pepper hot sauce and melted butter prior to serving."
        guard let dish10 = Dish(dishName: "Chicken Wings", dishPhoto: #imageLiteral(resourceName: "chickenWings"), dishDescription: dishDesc10)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc11="Tender slices of grilled New York strip steak served with the homemade sauce made with crushed dried chillies, ground taosted rice and soy sauce. It is savoury, hot and delicious for people who have a spicy pallette."
        guard let dish11 = Dish(dishName: "Grilled Beef", dishPhoto: #imageLiteral(resourceName: "grilledBeef"), dishDescription: dishDesc11)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc12="Marinated pork loins grilled to perfection,sliced and served with our homemade sauce, made with crushed dried chillies, ground taosted rice and soy sauce. Can be orderd as a small plate or big plate."
        guard let dish12 = Dish(dishName: " Grilled Pork", dishPhoto: #imageLiteral(resourceName: "grilledPork"), dishDescription: dishDesc12)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc13=" The pork ribs are topped with a balsamic vinegar barbecue and garlic sauce, and deep fried to crispy perfection. The meat literally falls off the bone. Served with a spicy Sriracha sauce for dipping."
        guard let dish13 = Dish(dishName: "Spare Ribs", dishPhoto:#imageLiteral(resourceName: "spareRibs"), dishDescription: dishDesc13)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc14="A traditional Thai appetizer, the dish is eaten by filling a lettuce leaf and folding it over a mix of ingredients including:shallots, peanuts, toasted coconut shreds, sliced lime, chilies and ginger. On top of it, put a dollop of homemade sweet Meang Kum sauce. This is served as a deconstructed dish and you can mix the ingredients as per your likes."
        guard let dish14 = Dish(dishName: "Meang Kum", dishPhoto: #imageLiteral(resourceName: "MeangKum"), dishDescription: dishDesc14)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc15="Wrapped in pandan leaf and fried in hot oil, these delectable, bite-sized chicken pieces are a traditional Thai favourites.Served with a special homemade sweet sauce for dipping including ingredients like soy sauce, plum sauce,molasses and lime with sesame seeds. Pandan leaves and is used widely in South Asian and Southeast Asian cooking as a flavoring. "
        guard let dish15 = Dish(dishName: "Gai Hor Bai Toey", dishPhoto: #imageLiteral(resourceName: "gaiHorBaiToey"), dishDescription: dishDesc15)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc16="This dish includes succulent pork is sliced thin, sun-dried for a day and marinated in a sugar and salt brine. Served with hot and spicy Sriracha sauce. It can be ordered in both small plate and big plate sizes."
        guard let dish16 = Dish(dishName: "Moo Dade Deaw", dishPhoto: #imageLiteral(resourceName: "mooDadeDeaw"), dishDescription: dishDesc16)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc17="A light, flavourful soup made with a clear broth, tofu, seasoned ground pork, mushrooms, white onions, cilantro and fresh chopped scallions. "
        guard let dish17 = Dish(dishName: "Tofu Soup", dishPhoto: #imageLiteral(resourceName: "TofuSoup"), dishDescription: dishDesc17)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc18="A pleasing combination of light broth,transparent glass noodles(also known as bean-thread noodles), seasoned ground pork, mushrooms, white onions, cilantro and fresh chopped scallions."
        guard let dish18 = Dish(dishName: "Glass Noodle Soup", dishPhoto: #imageLiteral(resourceName: "glassNoodleSoup"), dishDescription: dishDesc18)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc19="Tasty shrimp and pork wontons are featured in a light broth topped with chopped scallions. Wontons are made by spreading a square wrapper (a dough skin made of flour, egg, water, and salt) flat in the palm of one's hand, placing a small amount of filling in the center, and sealing the wonton into the desired shape by compressing the wrapper's edges together with the fingers"
        guard let dish19 = Dish(dishName: "Wonton Soup.", dishPhoto: #imageLiteral(resourceName: "WontonSoup"), dishDescription: dishDesc19)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc20="Simmered with coconut milk, a milder and slightly creamier soup, includes chicken, straw mushrooms, lemon grass, green onions, cilantro and galangal. Available in small and regular sizes, with options of chicken, tofu, prawns or mixed seafood. "
        guard let dish20 = Dish(dishName: "Tom Kah", dishPhoto: #imageLiteral(resourceName: "Tomkah"), dishDescription: dishDesc20)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc21="Two crispy pastries filled with your choice of fresh mixed vegetables or delicately spiced lean ground beef.Available in varieties of vegetarian or beef choices. It is a delicious north Indian street food. Served with spicy cilantro- mint chutney and sweet tamarind sauce for dipping. "
        guard let dish21 = Dish(dishName: "Samosas", dishPhoto: #imageLiteral(resourceName: "indian-samosas"), dishDescription: dishDesc21)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc22="The original Middle Eastern dip of garbanzo beans, tahini sauce, garlic, olive oil and lemon juice. Served with pita bread. It is savoury and with mild spices. Grape leaves and lamb mince can be added to the dish."
        guard let dish22 = Dish(dishName: "Hummus Bi-Tahini", dishPhoto: #imageLiteral(resourceName: "hummus bi tahini"), dishDescription: dishDesc22)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc23="Eggplant smoked on an open fire, pureed and mixed with tahini sauce, garlic, olive oil and lemon juice. Served with pita bread."
        guard let dish23 = Dish(dishName: "Baba Ghannoj", dishPhoto: #imageLiteral(resourceName: "baba-ganoush"), dishDescription: dishDesc23)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc24="Crispy vegetable samosa mildly spiced, served with potatoes, chickpeas, onions, topped with yogurt, cilantro and tamarind chutneys."
        guard let dish24 = Dish(dishName: "Samosa Chat", dishPhoto: #imageLiteral(resourceName: "samosa-chaat"), dishDescription: dishDesc24)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc25="A medley of vegetables, herbs and spices formed into patties, lightly breaded and fried. Served with cilantro and tamarind chutneys. It is a blend of boiled vegetables, mashed together and seasoned with chili, black pepper, salt and mixed powder of Indian spices."
        guard let dish25 = Dish(dishName: "Vegetable Cutlets", dishPhoto: #imageLiteral(resourceName: "VegCutlets"), dishDescription: dishDesc25)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc26="Delicately spiced fried fritters lightly battered in chickpea flour. Served with cilantro and tamarind chutneys. Available in multiple choices- Mixed Vegetables, Cauliflower, Paneer, Chicken & Fish."
        guard let dish26 = Dish(dishName: "Pakoras", dishPhoto: #imageLiteral(resourceName: "pakoras"), dishDescription: dishDesc26)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc27="Tender pieces of cheese marinated with delicate spices and roasted in the Tandoor. Served with sliced onions and our special cilantro and tamarind chutneys. Cottage cheese is called paneer in India."
        guard let dish27 = Dish(dishName: "Paneer Tikka", dishPhoto: #imageLiteral(resourceName: "paneerTikka"), dishDescription: dishDesc27)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc28="Boneless chicken marinated in yogurt, herbs, saffron and spices. Served on a bed of lettuce with cilantro, tamarind chutneys and sliced onions."
        guard let dish28 = Dish(dishName: "Chicken Tikka", dishPhoto: #imageLiteral(resourceName: "chickenTikka"), dishDescription: dishDesc28)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc29="Juicy pieces of true cod marinated with spices and saffron, then roasted in the Tandoor. Serveed with sliced onions and our special cilantro and tamarind chutneys."
        guard let dish29 = Dish(dishName: "Fish Tikka Kabob", dishPhoto: #imageLiteral(resourceName: "fishTikkaKabob"), dishDescription: dishDesc29)else {
            fatalError("Unable to instantiate dish")
        }
        let dishDesc30="Cream of spinach simmered with onions and spices. It comes with tender cottage cheese pieces in a creamy green gravy. It is served with with rice but can also be enjoyed with a naan or chapathi(kind of bread)."
        guard let dish30 = Dish(dishName: "Palak Paneer", dishPhoto: #imageLiteral(resourceName: "PalakPaneer"), dishDescription: dishDesc30)else {
            fatalError("Unable to instantiate dish")
        }
//        let dishDesc31="Chicken tidbits deep fried & quick sauteed in chef Hunan sauce. In the sauce hot red chiles are used, sliced open and the seeds scraped out. Hunan style leaves out the sweet and favors bold/savory/hot/sour combinations."
//        guard let dish31 = Dish(dishName: "General Tsao Chicken", dishPhoto: #imageLiteral(resourceName: "GeneralTsaoChicken"), dishDescription: dishDesc31)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc32="Sliced beef sauteed with broccoli and carrots. It has a savory taste with mild spices and light soy sauce."
//        guard let dish32 = Dish(dishName: "Beef with Broccoli", dishPhoto: #imageLiteral(resourceName: "BeefWithBroccoli"), dishDescription: dishDesc32)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc33="Beef with a crunch, sweet, spicy and smothered in sauce. Quickly stir -fried beef with scallions, garlic, ginger a sweet soy sauce with an amazing spicy zing. Rejoice!"
//        guard let dish33 = Dish(dishName: "Mongolian Beef", dishPhoto: #imageLiteral(resourceName: "MongolianBeef"), dishDescription: dishDesc33)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc34="Diced chicken sauteed with celery, carrots, baby corn, bell pepper and cashew nuts."
//        guard let dish34 = Dish(dishName: "Chicken with Cashew Nuts", dishPhoto: #imageLiteral(resourceName: "ChickenwithCashewNuts"), dishDescription: dishDesc34)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc35="Fresh deep fried chicken breast with sweet & sour sauce. Sweet and sour sauce is made of sugar, ketchup, white vinegar, and soy sauce, and additional ingredients including pineapple, green pepper (capsicum), and onion."
//        guard let dish35 = Dish(dishName: "Sweet & Sour Chicken", dishPhoto: #imageLiteral(resourceName: "Sweet&SourChicken"), dishDescription: dishDesc35)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc36="Pork mixture is sauteed until pork loses it is pink color - stirring to a crumble. Then steamed green beans and garlic are added - sauteed for 3-5 minutes more. Combined with hoisin sauce, sugar, pepper flakes and soy sauce in a small bowl - stirring with a whisk to incorporate ingredients."
//        guard let dish36 = Dish(dishName: "Sauteed String Beans with Ground Pork", dishPhoto: #imageLiteral(resourceName: "BeansWithPork"), dishDescription: dishDesc36)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc37="Kung Pao Chicken, also transcribed as Gong Bao or Kung Po, is a spicy stir-fry Chinese dish made with chicken, peanuts, vegetables, and chili peppers. The classic dish in Sichuan cuisine originated in the Sichuan Province of south-western China and includes Sichuan peppercorns."
//        guard let dish37 = Dish(dishName: "Kung Pao Chicken ", dishPhoto: #imageLiteral(resourceName: "KungPaoChicken"), dishDescription: dishDesc37)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc38="Combination chow mein has lots of veggies, prawns, beef and chicken. Serve with boiled rice."
//        guard let dish38 = Dish(dishName: "Combination Chow Mein", dishPhoto: #imageLiteral(resourceName: "CombinationOfChowMien"), dishDescription: dishDesc38)else {
//            fatalError("Unable to instantiate dish")
//        }
//        let dishDesc39="Chicken drumb stick with soy sauce, sugar, and wine.The chicken comes out flavorful with a sweet and tangy glaze. Serve with rice and steamed snow peas & lettuce for a complete meal"
//        guard let dish39 = Dish(dishName: "Chicken Drumb Stick With Soy Sauce", dishPhoto: #imageLiteral(resourceName: "ChickenDrumStickWithSoySauce"), dishDescription: dishDesc39)else{
//            fatalError("Unable to instantiate dish")
//        }
        guard let restaurant1 = Restaurants(name: "Saffron Grill", photo: photo1, resDescription: desc1, contactInfo: contact1, Menu: [dish21,dish22,dish23,dish24,dish25,dish26,dish27,dish28,dish29,dish30]) else {
            fatalError("Unable to instantiate restuarant11")
        }
        guard let restuarant2 = Restaurants(name: "Yea's Wok", photo: photo2, resDescription: desc2, contactInfo: contact2, Menu: [dish1]) else {
            fatalError("Unable to instantiate restaurant2")
        }
        
        guard let restuarant3 = Restaurants(name: "Baitong", photo: photo3, resDescription: desc3, contactInfo: contact3, Menu: [dish2,dish3,dish4,dish5,dish6,dish7,dish8,dish9,dish10,dish11,dish12,dish13,dish14,dish15,dish16,dish17,dish18,dish19,dish20]) else {
            fatalError("Unable to instantiate restaurant3")
        }
        restaurants+=[restaurant1,restuarant2,restuarant3]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RestuarantsTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestuarantsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RestaurantTableViewCell.")
        }
        let restaurant=restaurants[indexPath.row]
        cell.def.image = restaurant.photo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        let indexPath = tableView.indexPathForSelectedRow!
        valueToPass = restaurants[indexPath.row]
        self.performSegue(withIdentifier: "RestViewSegue", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let resController = segue.destination as! RestaurantController
        
        // set a variable in the second view controller with the data to pass
        resController.passedRes=valueToPass
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
