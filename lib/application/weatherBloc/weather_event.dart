abstract class WeatherEvent{}

class WeatherInitialEvent extends WeatherEvent{}

class WeatherSuccessEvent extends WeatherEvent{}

class WeatherErrorEvent extends WeatherEvent{}

class InternetLostEvent extends WeatherEvent{}

class InternetGainedEvent extends WeatherEvent{}