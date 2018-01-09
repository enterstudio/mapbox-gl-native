#import "NSOrthography+MGLAdditions.h"

@implementation NSOrthography (MGLAdditions)

+ (NSString *)mgl_dominantScriptForMapboxStreetsLanguage:(NSString *)language {
    if (@available(iOS 11.0, *)) {
        NSLocale *locale = [NSLocale localeWithLocaleIdentifier:language];
        NSOrthography *orthography = [NSOrthography defaultOrthographyForLanguage:locale.localeIdentifier];

        return orthography.dominantScript;
    }

    // Manually map Mapbox Streets languages to ISO 15924 script codes.
    NSSet *latinLanguages = [NSSet setWithObjects:@"de", @"en", @"es", @"fr", @"pt", nil];
    NSSet *hansLanaguages = [NSSet setWithObjects:@"zh", @"zh-Hans", nil];
    NSSet *cyrillicLanguages = [NSSet setWithObjects:@"ru", nil];
    NSSet *arabicLanguages = [NSSet setWithObjects:@"ar", nil];

    if ([latinLanguages containsObject:language]) {
        return @"Latn";
    } else if ([hansLanaguages containsObject:language]) {
        return @"Hans";
    } else if ([cyrillicLanguages containsObject:language]) {
        return @"Cyrl";
    } else if ([arabicLanguages containsObject:language]) {
        return @"Arab";
    } else {
        // Code for undetermined script
        return @"Zyyy";
    }
}

@end
