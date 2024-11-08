public with sharing class RestCalloutsHowToTest {
    public static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    /**
     * @name: makeGetCallout
     * @description: This method is used to make a REST callout to the external warehouse system. 
     *               Create or update Products on the system
     * @return: void
    */
    @future(callout=true)
    public static void makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');

        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            List<Product2> results = (List<Product2>) JSON.deserialize(response.getBody(), List<Product2>.class);
            
            upsert results;
        }
    }
}
