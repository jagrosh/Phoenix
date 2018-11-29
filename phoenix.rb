require 'api-ai-ruby'
require 'discordrb'

bot = Discordrb::Bot.new token: ENV['BOT_TOKEN'], ignore_bots: true
sessions = {}

bot.ready do |event|
  puts "Logged in as #{bot.profile.username} (ID:#{bot.profile.id}) | #{bot.servers.size} servers"
  bot.game = '🔥🔥🔥'
end

bot.message do |event|
  if event.server && !event.author.roles.any?
    str = "#{event.channel.id}-ClientToken"
    if ENV[str]
      if !sessions[event.channel.id]
        sessions[event.channel.id] = ApiAiRuby::Client.new( :client_access_token => ENV[str] )
      end
      response = sessions[event.channel.id].text_request event.message.content
      speech = response[:result][:fulfillment][:speech]
      if speech && !speech.empty?
        event.channel.start_typing
        sleep 1
        event.respond "#{event.author.mention}, #{speech}"
      end
    end
  end
end

bot.run