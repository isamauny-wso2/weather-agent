import ballerina/http;
import ballerina/log;
import ballerinax/ai;

listener ai:Listener WeatherRecommendationListener = new (listenOn = check http:getDefaultListener());
string openAIToken = getAIGWToken();

service /WeatherRecommendation on WeatherRecommendationListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        log:printInfo("Starting agent");
        string llmResponse = check _WeatherRecommendationAgent->run(request.message, request.sessionId);
        return {message: llmResponse};
    }
}
