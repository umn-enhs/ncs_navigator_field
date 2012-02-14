//
//  DispositionCode.m
//  NCSMobile
//
//  Created by John Dzak on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DispositionCode.h"
#import "PickerOption.h"

@implementation DispositionCode

@synthesize event = _event;
@synthesize disposition = _disposition;
@synthesize interimCode = _interimCode;

- (id)initializeWithInterimCode:(NSString*)code disposition:(NSString*)disposition event:(NSString*)event {
    if (self = [super init]) {
        self.event = event;
        self.disposition = disposition;
        self.interimCode = code;

    }
    return self;
}

+ (DispositionCode*)dc:(NSString*)event disposition:(NSString*)disposition interimCode:(NSString*)code {
    return [[DispositionCode alloc] initializeWithInterimCode:code disposition:disposition event:event];
}

+ (NSArray*) pickerOptions {
    NSMutableArray* options = [[NSMutableArray alloc] init];
    for (DispositionCode* c in [DispositionCode all]) {
        
        NSString* abbrev = [DispositionCode abbreviationForDispositionEvent:c.event];
        PickerOption* o = [[PickerOption alloc] 
            initWithText:[NSString stringWithFormat:@"%@ - %@", abbrev, c.disposition]
            value:[c.interimCode integerValue]];
        [options addObject:o];
    }
    return options;
}

- (PickerOption*) toPickerOption {
//    NSString* abbrev = [DispositionCode abbreviationForDispositionEvent:[self event]];
    PickerOption* o = [[PickerOption alloc] 
                       initWithText:[NSString stringWithFormat:@"%%@", [self disposition]]
                       value:[[self interimCode] integerValue]];
    return o;
}

+ (NSString*) abbreviationForDispositionEvent:(NSString*)event {
    NSString* abbrev = [NSString string];

    if ([self string:event containsString:@"General"]) {
        abbrev = @"General";
    } else if ([self string:event containsString:@"SAQ"]) {
        abbrev = @"SAQ";
    } else if ([self string:event containsString:@"Telephone"]) {
        abbrev = @"Telephone";
    } else if ([self string:event containsString:@"Internet"]) {
        abbrev = @"Internet";
    } else {
        abbrev = event;
    }
    return abbrev;
}
                    
+ (BOOL) string:(NSString*)string containsString:(NSString*)substring {
    return [string rangeOfString:substring options:NSCaseInsensitiveSearch].location != NSNotFound;
}

+ (NSArray*) findForContactTypeId:(NSNumber*)contactType {
    return [self all];
}

// Generated with:
// 1. bundle exec mdes-console
// 2. $mdes20.disposition_codes.map{|c| "[DispositionCode dc:@\"#{c.event}\" disposition:@\"#{c.disposition}\" interimCode:@\"#{c.interim_code}\"],\n"}.each{|v| puts v}
//
+ (NSArray*) all {
    return [[NSArray alloc] initWithObjects:
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant cognitively unable to provide informed consent/complete interview" interimCode:@"010"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant deceased" interimCode:@"011"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant ineligible due to pregnancy loss" interimCode:@"012"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant not pregnant (not to be used with \"high-trier\" group)" interimCode:@"013"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant ineligible due to age" interimCode:@"014"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant not a household member" interimCode:@"015"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant incarcerated" interimCode:@"016"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant otherwise institutionalized" interimCode:@"017"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Other- participant ineligibility" interimCode:@"018"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Duplicate participant" interimCode:@"019"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant moved to known address: within PSU to non-sampled DU" interimCode:@"020"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant moved to known address: within PSU to a sampled DU" interimCode:@"021"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant moved to known address: outside of PSU to a non-NCS area" interimCode:@"022"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant moved to known address: outside PSU to different NCS PSU" interimCode:@"023"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant moved to unknown address" interimCode:@"024"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Other- eligibility unknown" interimCode:@"025"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Refused to Provide  Consent" interimCode:@"030"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Known participant refusal- soft" interimCode:@"031"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Known participant refusal- hard" interimCode:@"032"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"In Progress/Partial with insufficient information" interimCode:@"033"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Not Worked" interimCode:@"034"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Unable to reach participant/temporarily unavailable" interimCode:@"035"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Unable to Access DU" interimCode:@"036"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"No one at home/Ring no answer" interimCode:@"037"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Telephone Answering Device (eligibility confirmed by message)" interimCode:@"038"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Call Monitoring/Blocking Device (eligibility confirmed by message)" interimCode:@"039"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Message left" interimCode:@"040"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"No message left" interimCode:@"041"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Appointment made - Hard Appointment" interimCode:@"042"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Appointment made - Soft  Appointment" interimCode:@"043"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Broken appointment" interimCode:@"044"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Asked to call back, no appointment" interimCode:@"045"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Gatekeeper Refusal- Soft" interimCode:@"046"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Gatekeeper Refusal - Hard" interimCode:@"047"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Participant Unavailable during Field period/Out of Window" interimCode:@"048"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Respondent temporarily incapacitated/under the influence of controlled substances" interimCode:@"049"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Maximum attempts" interimCode:@"050"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Inadequate audio quality" interimCode:@"051"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Location/Activity prevents interview" interimCode:@"052"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Language Barrier" interimCode:@"053"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Long Term Illness" interimCode:@"054"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Eligible Non-response- Other" interimCode:@"055"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Completed Consent/Interview in English" interimCode:@"060"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Completed Consent/Interview in Spanish" interimCode:@"061"],
            [DispositionCode dc:@"General Study Visit Event" disposition:@"Completed Consent/Interview in Other Language" interimCode:@"062"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Participant Screened Out" interimCode:@"010"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"No Eligible Participant" interimCode:@"011"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Duplicate Listing" interimCode:@"012"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Participant deceased" interimCode:@"013"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Cognitively  unable to Complete" interimCode:@"014"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"No address or participant information available" interimCode:@"020"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Never mailed" interimCode:@"021"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Questionnaire never returned/No response" interimCode:@"022"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Undeliverable" interimCode:@"023"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Returned with Forwarding Information" interimCode:@"024"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Known participant refusal- soft" interimCode:@"030"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Known participant refusal- hard" interimCode:@"031"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Household-Level refusal- soft" interimCode:@"032"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Household-Level refusal- hard" interimCode:@"033"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Blank questionnaire returned" interimCode:@"034"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Partial with insufficient information" interimCode:@"035"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Participant Unavailable during Field Period/Out of Window" interimCode:@"036"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Completed questionnaire, but not returned during field period" interimCode:@"037"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Language Barrier" interimCode:@"038"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Literacy Issues" interimCode:@"039"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Other" interimCode:@"040"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Completed Questionnaire in English" interimCode:@"050"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Partial with sufficient information in English" interimCode:@"051"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Completed interview in Spanish" interimCode:@"052"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Partial with sufficient information in Spanish" interimCode:@"053"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Completed interview in Other Language" interimCode:@"054"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Partial with sufficient information in Other Language" interimCode:@"055"],
            [DispositionCode dc:@"Mailed Back SAQ Event" disposition:@"Appointment successfully scheduled (when mail contact was used to schedule upcoming visit)" interimCode:@"056"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Out of sample" interimCode:@"010"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Fax/Data line" interimCode:@"011"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Disconnected number" interimCode:@"012"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Non-working number" interimCode:@"013"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Temporarily out of service (for entire duration of field period)" interimCode:@"014"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Special technological circumstances" interimCode:@"015"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Number changed/no new number" interimCode:@"016"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Non-residence" interimCode:@"017"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Business/Organization" interimCode:@"018"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Institution" interimCode:@"019"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Ineligible Group quarters" interimCode:@"020"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant not household resident" interimCode:@"021"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant ineligible due to pregnancy loss" interimCode:@"022"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant not pregnant (not to be used with \"high-trier\" group)" interimCode:@"023"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant ineligible due to age" interimCode:@"024"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"No eligible participant" interimCode:@"025"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant deceased" interimCode:@"026"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Cognitively  unable to Complete" interimCode:@"027"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant incarcerated" interimCode:@"028"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant otherwise institutionalized" interimCode:@"029"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"No known telephone number" interimCode:@"030"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Other- participant ineligibility" interimCode:@"031"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant moved to known address: within PSU to non-sampled DU" interimCode:@"040"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant moved to known address: within PSU to a sampled DU" interimCode:@"041"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant moved to known address: outside of PSU to a non-NCS area" interimCode:@"042"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant moved to known address: outside PSU to different NCS PSU" interimCode:@"043"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant moved to unknown address" interimCode:@"044"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Other- eligibility unknown" interimCode:@"045"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Not attempted" interimCode:@"046"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Telephone always busy" interimCode:@"047"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Ring/No Answer" interimCode:@"048"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Telephone Answering Device (eligibility unknown)" interimCode:@"049"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Call Monitoring/Blocking Device (eligibility unknown)" interimCode:@"050"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Technical telephone problems" interimCode:@"051"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Ambiguous operator message" interimCode:@"052"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Number changed/New number available" interimCode:@"053"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Known dwelling unit, unknown participant eligibility" interimCode:@"054"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Unknown if participant is a household resident" interimCode:@"055"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Other" interimCode:@"056"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Household-level refusal- soft" interimCode:@"060"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Household-level refusal- hard" interimCode:@"061"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Known participant refusal- soft" interimCode:@"062"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Known participant refusal- hard" interimCode:@"063"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Partial with insufficient information" interimCode:@"064"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Appointment made - Hard Appointment" interimCode:@"065"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Appointment made - Soft  Appointment" interimCode:@"066"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Broken appointment" interimCode:@"067"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Asked to call back, no appointment" interimCode:@"068"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant never available" interimCode:@"069"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Telephone Answering Device (eligibility confirmed by message when known respondent's name is stated)" interimCode:@"070"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Call Monitoring/Blocking Device (eligibility confirmed by message when known respondent's name is stated)" interimCode:@"071"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Message left" interimCode:@"072"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"No message left" interimCode:@"073"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant Unavailable during Field Period/Out of Window" interimCode:@"074"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Respondent temporarily incapacitated/under the influence of controlled substances" interimCode:@"075"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Household language barrier" interimCode:@"076"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Participant language barrier" interimCode:@"077"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Long Term Illness" interimCode:@"078"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Inadequate audio quality" interimCode:@"079"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Location/Activity prevents interview" interimCode:@"080"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Other" interimCode:@"081"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Completed interview in English" interimCode:@"090"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Partial with sufficient information in English" interimCode:@"091"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Completed interview in Spanish" interimCode:@"092"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Partial with sufficient information in Spanish" interimCode:@"093"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Completed interview in Other Language" interimCode:@"094"],
            [DispositionCode dc:@"Telephone Interview Event" disposition:@"Partial with sufficient information in Other Language" interimCode:@"095"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Completed but ineligible" interimCode:@"010"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Incomplete but ineligible" interimCode:@"011"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Duplicate listing" interimCode:@"012"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"No known email address" interimCode:@"020"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"No invitation sent" interimCode:@"021"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Nothing returned" interimCode:@"022"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Undeliverable" interimCode:@"023"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Undeliverable with forwarding information" interimCode:@"024"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Email address not in sample" interimCode:@"025"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Other" interimCode:@"026"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Partial with insufficient information" interimCode:@"030"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Hard Refusal" interimCode:@"031"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Soft Refusal" interimCode:@"032"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Logged in but did not complete any items" interimCode:@"033"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Non-Contact" interimCode:@"034"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Unavailable during field period/out of window" interimCode:@"035"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Completed questionnaire, but not returned during field period" interimCode:@"036"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Language Barrier" interimCode:@"037"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Other Non-response" interimCode:@"038"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Completed interview in English" interimCode:@"040"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Partial with sufficient information in English" interimCode:@"041"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Completed interview in Spanish" interimCode:@"042"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Partial with sufficient information in Spanish" interimCode:@"043"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Completed interview in Other Language" interimCode:@"044"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Partial with sufficient information in Other Language" interimCode:@"045"],
            [DispositionCode dc:@"Internet Survey Event" disposition:@"Appointment successfully scheduled (when web contact was used to schedule upcoming visit)" interimCode:@"046"], nil];
}

@end
