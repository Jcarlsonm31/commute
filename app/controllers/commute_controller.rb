class CommuteController < ApplicationController
require 'rest-client'
require 'json'

  def route_times
    route_array = Array.new   
    ampm = Time.now.in_time_zone('America/Los_Angeles').strftime("%p")
    api_key = ENV['GOOGLE_API_KEY']
    
    if ampm == 'AM'
      route_array << 'Home to Work'
      #Home to Work I-5
      url = 'https://maps.googleapis.com/maps/api/directions/json?origin=200+N+47th+St+Seattle,+WA+98103&destination=3700+Monte+Villa+Pkwy+Bothell,+WA+98021&waypoints=via:47.819120%2C-122.282513&departure_time=now&traffic_model=best_guess&key=' + api_key
      response = JSON.parse(RestClient.get(url))
      route_array << 'I-5'
      route_array << response['routes'][0]['legs'][0]['duration_in_traffic']['text']
      #Home to Work 520
      url = 'https://maps.googleapis.com/maps/api/directions/json?origin=200+N+47th+St+Seattle,+WA+98103&destination=3700+Monte+Villa+Pkwy+Bothell,+WA+98021&waypoints=via:47.641528%2C-122.264269&departure_time=now&traffic_model=best_guess&key=' + api_key
      response = JSON.parse(RestClient.get(url))
      route_array << '520'
      route_array << response['routes'][0]['legs'][0]['duration_in_traffic']['text']
      #Home to Work 522
      url = 'https://maps.googleapis.com/maps/api/directions/json?origin=200+N+47th+St+Seattle,+WA+98103&destination=3700+Monte+Villa+Pkwy+Bothell,+WA+98021&waypoints=via:47.696960%2C-122.305681&departure_time=now&traffic_model=best_guess&key=' + api_key
      response = JSON.parse(RestClient.get(url))
      route_array << '522'
      route_array << response['routes'][0]['legs'][0]['duration_in_traffic']['text']
    else
      route_array << 'Work to Home'
      #Work to Home I-5
      url = 'https://maps.googleapis.com/maps/api/directions/json?origin=3700+Monte+Villa+Pkwy+Bothell,+WA+98021&destination=200+N+47th+St+Seattle,+WA+98103&waypoints=via:47.826180%2C-122.254351&departure_time=now&traffic_model=best_guess&key=' + api_key
      response = JSON.parse(RestClient.get(url))
      route_array << 'I-5'
      route_array << response['routes'][0]['legs'][0]['duration_in_traffic']['text']
      #Work to Home 520
      url = 'https://maps.googleapis.com/maps/api/directions/json?origin=3700+Monte+Villa+Pkwy+Bothell,+WA+98021&destination=200+N+47th+St+Seattle,+WA+98103&waypoints=via:47.640313%2C-122.255311&departure_time=now&traffic_model=best_guess&key=' + api_key
      response = JSON.parse(RestClient.get(url))
      route_array << '520'
      route_array << response['routes'][0]['legs'][0]['duration_in_traffic']['text']
      #Work to Home 522
      url = 'https://maps.googleapis.com/maps/api/directions/json?origin=3700+Monte+Villa+Pkwy+Bothell,+WA+98021&destination=200+N+47th+St+Seattle,+WA+98103&waypoints=via:47.696960%2C-122.305681&departure_time=now&traffic_model=best_guess&key=' + api_key
      response = JSON.parse(RestClient.get(url))
      route_array << '522'
      route_array << response['routes'][0]['legs'][0]['duration_in_traffic']['text']
    end

    render status: 200, json: route_array.to_json
  end                                                   


end
