@isTest
public with sharing class RestCalloutHowToTest_TEST {
    @isTest
    public static void performCalloutTestUsingMock200() {
        Test.setMock(HttpCalloutMock.class, new RestCalloutHowToTestMock());
        Test.startTest();
        RestCalloutsHowToTest.makeGetCallout();
        Test.stopTest();

        List<Product2> products = [SELECT Id, Name FROM Product2 ORDER BY Name ASC];
        Assert.areEqual(2, products.size());
        Assert.areEqual('Product Name Test 1', products[0].Name);
        Assert.areEqual('Product Name Test 2', products[1].Name);
    }
}