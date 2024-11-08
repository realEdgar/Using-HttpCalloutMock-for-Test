@isTest
public with sharing class RestCalloutHowToTestMock implements HttpCalloutMock {
    // Implement Http Mock Callout
    public HttpResponse respond(HttpRequest request){
        HttpResponse respond = new HttpResponse();
        respond.setStatusCode(200);
        respond.setBody('[{ "name": "Product Name Test 1" }, { "name": "Product Name Test 2" }]');
        
        return respond;
    }
}