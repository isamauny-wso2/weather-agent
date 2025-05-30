import ballerina/http;
import ballerinax/ai;
import ballerina/log;

listener ai:Listener WeatherRecommendationListener = new (listenOn = check http:getDefaultListener());
string openAIToken = "";

service /WeatherRecommendation on WeatherRecommendationListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        //log:printInfo ("Obtaining AI GW token");
        //openAIToken = getAIGWToken();
        log:printInfo ("Starting agent");
        string llmResponse = check _WeatherRecommendationAgent->run(request.message, request.sessionId);
        return {message: llmResponse};
    }
}
