#import <Foundation/Foundation.h>
#import "Snape.h"
#import "Circle.h"
#import "Rectangle.h"
#import "Car.h"
#import "Slant6.h"
#import "AllweatherRadial.h"
#import "NSString+NumberConvenience.h"
#import "CategoryThing.h"
#import "ITunesFinder.h"
#import "Thingie.h"
#import "NSMutableArray+MutableDesc.h"
#import "Garage.h"

//BOOL areIntsDifferent(int thing1, int thing2) 
//{
//    if(thing1 == thing2) {
//        return (NO);
//    } else {
//        return (YES);
//    }
//}

////NSString *booleanString(BOOL yesNo)
//{
//    if(yesNo == NO) {
//        return (@"no");
//    } else {
//        return (@"yes");
//    }
//}



//typedef enum {
//    kCircle,
//    kRectangle
//} Abc;

//typedef enum {
//    kRedColor,
//    kRedBlueColor
//} Def;
//
//typedef struct {
//    int x, y, width, height;
//} SnapeRect;

//typedef struct {
//    Abc abc;
//    Def def;
//    SnapeRect snapRect;
//} Snape;

//NSString *colorName(Def def) 
//{
//    switch (def) {
//        case kRedColor:
//            return @"red";
//            break;
//        case kRedBlueColor:
//            return @"redblue";
//            break;
//    }
//    return @"no color";
//}
//
//void drawCircle(SnapeRect snapeRect, Def def)
//{
//    NSLog(@"drawing a cricle at (%d %d %d %d) in %@",snapeRect.x, snapeRect.y,snapeRect.width,snapeRect.height, colorName(def));
//}
//
//void drawRectangle(SnapeRect snapeRect, Def def)
//{
//    NSLog(@"drawing a rectangle at (%d %d %d %d) in %@",snapeRect.x, snapeRect.y,snapeRect.width,snapeRect.height, colorName(def));
//}
//
//void drawSnaper(Snape snapes[], int count)
//{
//    for (int i=0; i<count; i++) {
//        switch (snapes[i].abc) {
//            case kCircle:
//                drawCircle(snapes[i].snapRect
//                           , snapes[i].def);
//                break; 
//            case kRectangle:
//                drawRectangle(snapes[i].snapRect
//                              , snapes[i].def);
//                break;
//                
//            default:
//                break;
//        }
//    }
//}

//void aaa(id snaps[], int count)
//{
//    for (int i=0; i<count; i++) {
//        [snaps[i] draw];
//    }
//}

Car *make(NSString *name, NSString *make, NSString *model, int modelYear, int numberOfDoors, float mileage, int horsepower) {
    Car *car = [[[Car alloc] init] autorelease];
    
    car.name = name;
    car.make = make;
    car.model = model;
    car.modelYear = modelYear;
    car.numberOfDoors = numberOfDoors;
    car.mileage = mileage;
    
    for (int i = 0; i < 4; i++) {
        Tire *tire = [[[Tire alloc] initWithPressure: 20 + i treadDepth: 20 - i] autorelease];
        
        [car setTire: tire atIndex: i];
    }
    
    Slant6 *slant6 = [[[Slant6 alloc] init] autorelease];
    [slant6 setValue: [NSNumber numberWithInt: horsepower] forKey: @"horsepower"];
    car.engine = slant6;
    
    
    return (car);
}

int main(int argc, const char * argv[])
{
    //    BOOL areIntsDiffenent;
    //    areIntsDiffenent = areIntsDifferent(5, 5);
    //    NSLog(@"%d and %d different %@", 5,5, booleanString(areIntsDiffenent));
    //    
    //    areIntsDiffenent = areIntsDifferent(23, 52);
    //    NSLog(@"%d and %d different %@", 23,52, booleanString(areIntsDiffenent));
    //    
    //    FILE *wordFile = fopen("/Users/zhenglibao/HelloWorld/HelloWorld/HelloWorld/ReadMe.txt", "r");
    //    char word[100];
    //    while (fgets(word, 100, wordFile)) {
    //        word[strlen(word) - 1] = '\0';
    //        NSLog(@"%s and %zu",word,strlen(word));
    //    }
    //    fclose(wordFile);
    
    //    Snape snaps[3];
    //    
    //    SnapeRect snapeRect = {0, 0, 10, 30};
    //    snaps[0].abc = kCircle;
    //    snaps[0].def = kRedColor;
    //    snaps[0].snapRect = snapeRect;
    //    
    //    SnapeRect snapRect1 = {10,20,10,50};
    //    snaps[1].abc = kRectangle;
    //    snaps[1].def = kRedBlueColor;
    //    snaps[1].snapRect = snapRect1;
    //    
    //    drawSnaper(snaps, 2);
    
    //    id snaps[2];
    //    SnapeRect snapeRect = {0, 0, 10, 30};
    //    snaps[0] = [Circle new];
    //    [snaps[0] setBounds: snapeRect];
    //    [snaps[0] setFillColor: kRedColor];
    //
    //    SnapeRect snapRect1 = {10,20,10,50};
    //    snaps[1] = [Rectangle new];
    //    [snaps[1] setBounds: snapRect1];
    //    [snaps[1] setFillColor: kRedBlueColor];
    //        
    //    aaa(snaps, 2);
    
    //    Car *car = [Car new];
    //    [car print];
    
    //    Car *car = [Car new];
    //    
    //    for (int i = 0; i < 4; i++) {
    //        Tire *tire = [AllweatherRadial new];
    //        [car setTire:tire atIndex:i];
    //    }
    //    
    //    Engine *engine = [Slant6 new];
    //    [car setEngine:engine];
    //    
    //    [car print];
    
    //    NSAutoreleasePool *pool  = [[NSAutoreleasePool alloc] init];
    //    
    //    NSFileManager *manager = [NSFileManager defaultManager];
    //    
    //    NSString *home;
    //    home = [@"~" stringByExpandingTildeInPath];
    //    
    //    NSMutableArray *files = [NSMutableArray arrayWithCapacity: 42];
    //    
    //    for (NSString *filename in [manager enumeratorAtPath:home]) {
    //        if ([[filename pathExtension] isEqualTo: @"jpg"]) {
    //            [files addObject: filename];
    //        }
    //    }
    //    
    //    for (NSString *filename in files) {
    //        NSLog(@"%@", filename);
    //    }
    //    
    //    
    //    [pool drain];
    
    //    Car *car = [Car new];
    //    
    //    Engine *engine = [Engine new];  //retaincount 1
    //    [car setEngine: engine];  //retaincount 2
    //    [engine release];  //retaincount 1
    //    
    //    
    //    Engine *engine1 = [Engine new];  //retaincount e1 1
    //    [car setEngine: engine1];  //retaincount e1 2 e 0 delloc
    //    [engine1 release];  //retaincount e1 1
    //    NSLog(@"%@", [engine description]);
    //    NSLog(@"engine:%lu",[engine retainCount]);
    //    NSLog(@"engine1:%lu",[engine1 retainCount]);
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    Car *car = [[Car alloc] init];
    //    Engine *engine = [[Engine alloc] init];
    //    [car setEngine:engine];
    //    [engine release];
    //    [car autorelease];
    //    
    //    [car print];
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    Car *car = [[Car alloc] init];
    //    car.name = @"abc";
    //    
    //    for (int i = 0; i < 4; i++) {
    //        //        Tire *tire = [[AllweatherRadial alloc] initWithPressure: 20 + i treadDepth: 20 - i];
    //        AllweatherRadial *tire = [[AllweatherRadial alloc] init];
    //        tire.rainHandling = 25;
    //        tire.snowHandling = 30;
    //        
    //        [car setTire: tire atIndex: i];
    //        [tire release];
    //    }
    //    
    //    Engine *engine = [[Slant6 alloc] init];
    //    car.engine = engine;
    //    [engine release];
    //    
    //    [car print];
    //    
    //    [car release];
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //    
    //    [dict setObject: [@"hello" lengthAsNumber] forKey: @"hello"];
    //    [dict setObject: [@"ilikefish" lengthAsNumber] forKey: @"ilikefish"];
    //    [dict setObject: [@"open" lengthAsNumber] forKey: @"open"];
    //    
    //    NSLog(@"%@", dict);
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    CategoryThing *thing = [[CategoryThing alloc] init];
    //    [thing setThing1: 50];
    //    [thing setThing2:6];
    //    [thing setThing3: 33];
    //    
    //    NSLog(@"%@", thing);
    //    
    //    [thing release];
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    NSNetServiceBrowser *browser = [[NSNetServiceBrowser alloc] init];
    //    
    //    ITunesFinder *itunes = [[ITunesFinder alloc] init];
    //    
    //    [browser setDelegate: itunes];
    //    
    //    [browser searchForServicesOfType: @"_daap._tcp" inDomain: @"local."];
    //    
    //    NSLog(@"begun browsing!");
    //    
    //    [[NSRunLoop currentRunLoop] run];
    //    
    //    [browser release];
    //    [itunes release];
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //
    //    Car *car = [[Car alloc] init];
    //    
    //    if (![car respondsToSelector: @selector(setEngine:)]) {
    //        NSLog(@"year!!");
    //    } else {
    //        NSLog(@"no!!");
    //
    //    }
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    Car *car = [[Car alloc] init];
    //    car.name = @"Herbie";
    //    
    //    for (int i = 0; i < 4; i++) {
    //        Tire *tire = [[Tire alloc] initWithPressure: 20 + i treadDepth: 20 - i];
    //        
    //        [car setTire: tire atIndex: i];
    //        [tire release];
    //    }
    //    
    //    Slant6 *slant6 = [[Slant6 alloc] init];
    //    car.engine = slant6;
    //    [slant6 release];
    //    
    //    [car print];
    //    
    //    NSLog(@"---------------");
    //    
    //    Car *carCopy = [car copy];
    //    [carCopy print];
    //      
    //    [car release];
    //    [carCopy release];
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", nil];
    //    
    //    [array writeToFile: @"/Users/zhenglibao/HelloWorld/HelloWorld/HelloWorld/ReadMe.txt" atomically: YES];
    //    
    //    NSArray *array1 = [NSArray arrayWithContentsOfFile: @"/Users/zhenglibao/HelloWorld/HelloWorld/HelloWorld/ReadMe.txt"];
    //    
    //    NSLog(@"%@", array1);
    //    
    //    [pool release];
    
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //    
    //    Thingie *thingie1 = [[Thingie alloc] initWithName: @"thingie1" magicNumber: 42 shoeSiez: 10.5];
    //    
    //    Thingie *otherThingie1 = [[[Thingie alloc] initWithName: @"thingie2" magicNumber: 23 shoeSiez: 13] autorelease];
    //    [thingie1.subThingies addObject: otherThingie1];
    //    
    //     Thingie *otherThingie2 = [[[Thingie alloc] initWithName: @"thingie3" magicNumber: 23 shoeSiez: 13] autorelease];
    //    [thingie1.subThingies addObject: otherThingie2];
    //    NSLog(@"%@", thingie1);
    //    
    //    NSData *data = [NSKeyedArchiver archivedDataWithRootObject: thingie1];
    //    [thingie1 release];
    //    
    //    thingie1 = [NSKeyedUnarchiver unarchiveObjectWithData: data];
    //    NSLog(@"%@", thingie1);
    //    
    //    [pool release];
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    Garage * garage = [[Garage alloc] init];
    garage.name = @"Feng's Garage";
    
    Car *car = make(@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
    [garage addCar: car];
    
    car = make(@"Badger", @"Acura", @"Integra", 1987, 5, 217036, 130);
    [garage addCar: car];
    
    car = make(@"Elvis", @"Acura", @"Legend", 1989, 4, 28123, 151);
    [garage addCar: car];
    
    car = make(@"Phoneix", @"Pontiac", @"Firebired", 1969, 2, 85128, 345);
    [garage addCar: car];
    
    car = make(@"Streaker", @"Pontiac", @"Silver Strevt", 1984, 2, 39100, 36);
    [garage addCar: car];
    
    [garage print];
    
    NSLog(@"We have %@ car", [garage valueForKeyPath: @"cars.@count"]);
    NSLog(@"We have a grand total of %@ miles", [garage valueForKeyPath: @"cars.@sum.mileage"]);
    NSLog(@"avg is %@ miles", [garage valueForKeyPath: @"cars.@avg.mileage"]);
    
    [garage setValue: @"adsf" forKey: @"abc"];
    NSLog(@"abc%@", [garage valueForKey: @"abc"]);
    
    NSMutableArray *cars = garage.cars;
    NSArray *array;
    
    NSPredicate *prediate = [NSPredicate predicateWithFormat: @"name == 'Streaker'"];
    NSLog(@"%s", [prediate evaluateWithObject: car] ? "yes" : "no");
    
    prediate = [NSPredicate predicateWithFormat: @"engine.horsepower > 150"];
    for (Car *car1 in cars) {
        if ([prediate evaluateWithObject: car1]) {
            NSLog(@"%@", car1);
        }
    }
        
    array = [[cars filteredArrayUsingPredicate: prediate] valueForKey: @"name"];
    NSLog(@"cars:%@", array);
    
    NSMutableArray *carsBak = [[cars mutableCopy] autorelease];
    [carsBak filterUsingPredicate: prediate];
    NSLog(@"carsBak:%@", carsBak);    
    
    NSPredicate *templatePrediate = [NSPredicate predicateWithFormat: @"name == $NAME"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: @"Herbie", @"NAME", nil];
    prediate = [templatePrediate predicateWithSubstitutionVariables: dict];
    array = [cars filteredArrayUsingPredicate: prediate];
    NSLog(@"dict:%@", array);
    
    array = [cars valueForKey: @"name"];
    prediate = [NSPredicate predicateWithFormat: @"SELF IN {'Herbie', 'Elvis'}"];
    array = [array filteredArrayUsingPredicate: prediate];
    NSLog(@"SELF IN:%@", array);
    
    prediate = [NSPredicate predicateWithFormat: @"name ENDSWITH[cd] 'r'"];
    array = [cars filteredArrayUsingPredicate: prediate];
    NSLog(@"name ENDSWITH[cd]:%@", array);    
    
    [garage release];
       
    [pool release];
    
    return (0);
}

