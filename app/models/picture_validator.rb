require 'uri'
require 'net/http'

class PictureValidator < ActiveModel::Validator
  def validate(record)
  if !validPicture?(record.picture)
    record.errors[:base] << "Bad Image Url"
  end
end

private 
  def validPicture?(imgUrl)
   
    if imgUrl == "user.png"
      return true;
    end

  url = URI.parse(imgUrl)

  Net::HTTP.start(url.host, url.port) do |http|
  response = http.head(url.path)
  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
    case response.content_type
    when "image/png", "image/gif", "image/jpeg"
     return true
    else
      return false
    end
  else
     return false
  end
  end
  rescue Exception => e
   return false
  end
end