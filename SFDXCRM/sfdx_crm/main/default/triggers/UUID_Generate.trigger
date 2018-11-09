trigger UUID_Generate on Account (before insert) {
    
For (Account a: Trigger.new){

Blob b = Crypto.GenerateAESKey(128);
String h = EncodingUtil.ConvertTohex(b);
String guid = h.SubString(0,8)+ '-' + h.SubString(8,12) + '-' + h.SubString(12,16) + '-' + h.SubString(16,20) + '-' + h.substring(20);
system.debug(guid);

a.UUID_Of_TheAccount__c = guid;
}
}