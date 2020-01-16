require 'sinatra'
require 'line/bot'
require 'dotenv/load'

def client
  @client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV["a2b4e4249814899de6fe35ae79112b5a"]
    config.channel_token = ENV["ehdAt+dztB2FXRggg7uqxu6KVSRsdABUGnWXOwqSDVD5sNlMEDDw0ceohVqkMOd4iMuigP6i+v86mYDOw9iPzTJV7teZ1dnPHQeLdtnuZYjequTg4VM7R9WBtHk/J63JeUvgbzEBzIm77nGGJcZuOQdB04t89/1O/w1cDnyilFU="]
  }
end

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end

  events = client.parse_events_from(body)
  events.each { |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text
        message = {
          type: 'text',
          text: event.message['text']
        }
        client.reply_message(event['replyToken'], message)
      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        response = client.get_message_content(event.message['id'])
        tf = Tempfile.open("content")
        tf.write(response.body)
      end
    end
  }

  "OK"
end
