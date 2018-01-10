#import <XCTest/XCTest.h>

#import "NSString+MGLAdditions.h"

@interface MGLNSStringAdditionsTests : XCTestCase

@end

@implementation MGLNSStringAdditionsTests

- (void)testTitleCasedString {
    NSLocale *locale = [NSLocale currentLocale];

    XCTAssertEqualObjects([@"© OpenStreetMap" mgl_titleCasedStringWithLocale:locale], @"© OpenStreetMap");
    XCTAssertEqualObjects([@"© OSM" mgl_titleCasedStringWithLocale:locale], @"© OSM");

    XCTAssertEqualObjects([@"Improve this map" mgl_titleCasedStringWithLocale:locale], @"Improve This Map");
    XCTAssertEqualObjects([@"Improve This Map" mgl_titleCasedStringWithLocale:locale], @"Improve This Map");

    XCTAssertEqualObjects([@"Improve the map" mgl_titleCasedStringWithLocale:locale], @"Improve the Map");
    XCTAssertEqualObjects([@"Improve The Map" mgl_titleCasedStringWithLocale:locale], @"Improve The Map");
    
    XCTAssertEqualObjects([@"Improve a map" mgl_titleCasedStringWithLocale:locale], @"Improve a Map");
    XCTAssertEqualObjects([@"Improve A Map" mgl_titleCasedStringWithLocale:locale], @"Improve A Map");

    XCTAssertEqualObjects([@"Improve for the map" mgl_titleCasedStringWithLocale:locale], @"Improve for the Map");
    XCTAssertEqualObjects([@"Improve For The Map" mgl_titleCasedStringWithLocale:locale], @"Improve For The Map");

    XCTAssertEqualObjects([@"Improve and map" mgl_titleCasedStringWithLocale:locale], @"Improve and Map");
    XCTAssertEqualObjects([@"Improve And Map" mgl_titleCasedStringWithLocale:locale], @"Improve And Map");

    XCTAssertEqualObjects([@"Improve while mapping" mgl_titleCasedStringWithLocale:locale], @"Improve While Mapping");
    XCTAssertEqualObjects([@"Improve While Mapping" mgl_titleCasedStringWithLocale:locale], @"Improve While Mapping");

    XCTAssertEqualObjects([@"Improve with the map" mgl_titleCasedStringWithLocale:locale], @"Improve With the Map");
    XCTAssertEqualObjects([@"Improve With The Map" mgl_titleCasedStringWithLocale:locale], @"Improve With The Map");

    XCTAssertEqualObjects([@"Improve this iPhone" mgl_titleCasedStringWithLocale:locale], @"Improve This iPhone");
    XCTAssertEqualObjects([@"Improve This iPhone" mgl_titleCasedStringWithLocale:locale], @"Improve This iPhone");
}

- (void)testTransliteratedString {
    if (@available(iOS 9.0, *)) {
        XCTAssertEqualObjects([@"Portland" mgl_transliteratedStringWithScript:@"Latn"], @"Portland");
        XCTAssertEqualObjects([@"Portland" mgl_transliteratedStringWithScript:@"Hans"], @"Portland");
        XCTAssertEqualObjects([@"Portland" mgl_transliteratedStringWithScript:@"Cyrl"], @"Портланд");
        XCTAssertEqualObjects([@"Portland" mgl_transliteratedStringWithScript:@"Arab"], @"پُرتلَند");
        XCTAssertEqualObjects([@"Portland" mgl_transliteratedStringWithScript:@"Fake"], @"Portland");

        XCTAssertEqualObjects([@"北京" mgl_transliteratedStringWithScript:@"Latn"], @"běi jīng");
        XCTAssertEqualObjects([@"北京" mgl_transliteratedStringWithScript:@"Hans"], @"北京");
        XCTAssertEqualObjects([@"北京" mgl_transliteratedStringWithScript:@"Cyrl"], @"бе̌и йӣнг");
        XCTAssertEqualObjects([@"北京" mgl_transliteratedStringWithScript:@"Arab"], @"بِِ̌ جِينگ");
        XCTAssertEqualObjects([@"北京" mgl_transliteratedStringWithScript:@"Fake"], @"北京");

        XCTAssertEqualObjects([@"Mосква" mgl_transliteratedStringWithScript:@"Latn"], @"Moskva");
        XCTAssertEqualObjects([@"Mосква" mgl_transliteratedStringWithScript:@"Hans"], @"Mосква");
        XCTAssertEqualObjects([@"Mосква" mgl_transliteratedStringWithScript:@"Cyrl"], @"Москва");
        XCTAssertEqualObjects([@"Mосква" mgl_transliteratedStringWithScript:@"Arab"], @"مُسكڤَ");
        XCTAssertEqualObjects([@"Mосква" mgl_transliteratedStringWithScript:@"Fake"], @"Mосква");

        XCTAssertEqualObjects([@"ロンドン" mgl_transliteratedStringWithScript:@"Latn"], @"rondon");
        XCTAssertEqualObjects([@"ロンドン" mgl_transliteratedStringWithScript:@"Hans"], @"ロンドン");
        XCTAssertEqualObjects([@"ロンドン" mgl_transliteratedStringWithScript:@"Cyrl"], @"рондон");
        XCTAssertEqualObjects([@"ロンドン" mgl_transliteratedStringWithScript:@"Arab"], @"رُندُن");
        XCTAssertEqualObjects([@"ロンドン" mgl_transliteratedStringWithScript:@"Fake"], @"ロンドン");
    } else {
        XCTAssertEqualObjects([@"Made-up Place" mgl_transliteratedStringWithScript:@"Latn"], @"Made-up Place");
        XCTAssertEqualObjects([@"Made-up Place" mgl_transliteratedStringWithScript:@"Hans"], @"Made-up Place");
        XCTAssertEqualObjects([@"Made-up Place" mgl_transliteratedStringWithScript:@"Cyrl"], @"Made-up Place");
        XCTAssertEqualObjects([@"Made-up Place" mgl_transliteratedStringWithScript:@"Arab"], @"Made-up Place");
        XCTAssertEqualObjects([@"Made-up Place" mgl_transliteratedStringWithScript:@"Fake"], @"Made-up Place");
    }
}

@end
