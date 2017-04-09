class TwitterController < ApplicationController

  def weighting
    require 'twitter'
    require 'googleauth'
    require "google/cloud/language"

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ukRaD39TUQgwSGd3lFhV9PNxC"
      config.consumer_secret     = "2XM5sij4i7vJoPUfHahKGZnRLHFb9cc326yNYYuPmhJTQitaB4"
      config.access_token        = "2577942758-oXKaHshrBWS6xR9NgwDGMUh03VF4J3eRwlHUD2J"
      config.access_token_secret = "jewinSdaF1y7ynaw44CL5jQ7GRcgcMiA5Rre7G5M8fpaX"
    end

    scopes =  ['https://www.googleapis.com/auth/cloud-platform','https://www.googleapis.com/auth/cloud-platform.read-only']
    authorization = Google::Auth.get_application_default(scopes)

    @dislikes = Topic.all
    language = Google::Cloud::Language.new

    number = Hash.new
    value = 0
    value_min = 10000
    value_max = -10000
    @dislikes.each do |dislike|
      p dislike
      t = client.search(dislike.name, :lang => "en").take(1).collect
      aux = ''
=begin
  t.each do |x|
    document = language.document x.text
    begin
      annotation = document.annotate
      p x.text
      p annotation.sentiment.score
      p annotation.sentiment.magnitude
      value = value + annotation.sentiment.score*annotation.sentiment.magnitude
    rescue
      next
    end
   end
=end
      t.each do |x|
      aux << ' ' << x.text
    end

    document = language.document aux
    annotation = document.annotate
    value = value + annotation.sentiment.score*annotation.sentiment.magnitude

    number[dislike.name.to_sym] = value
    value = 0
  end
    number.each do |key,val|
      if value_min > number[key]
        value_min = number[key]
      end

      if value_max < number[key]
        value_max = number[key]
      end
    end

      p value_min
      p value_max

    number.each do |key,val|
        v =  (val - value_min)/(value_max - value_min)
        if v > 0.95
          number[key] = v
        else
          number[key] = v + 0.05
        end
      end

      p  number


      number.each do |key,value|
        t = @dislikes.find_by(:name => key.to_s)
        t.weight = value
        t.save
      end
  end

end
