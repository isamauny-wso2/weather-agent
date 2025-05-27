import ballerina/http;
import ballerinax/ai;

listener ai:Listener WeatherRecommendationListener = new (listenOn = check http:getDefaultListener());

service /WeatherRecommendation on WeatherRecommendationListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {

        string stringResult = check _WeatherRecommendationAgent->run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
