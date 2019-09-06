# Phoenix
🔥 Discord autoreply bot using [DialogFlow](https://dialogflow.com/) and [discordrb](https://github.com/meew0/discordrb)

![Example](https://i.imgur.com/APQymvo.png)

---

## Self-Hosting

### Requirements
* Git
* Ruby
* Bundle (preferably)
* Dialogflow account & project

### Running the bot
1. Clone this repository
2. Run `bundle install` to install the dependencies (or `gem install discordrb` and `gem install api-ai-ruby`)
3. Set environment variables:
    * Set `BOT_TOKEN` to the bot's token
    * Set `BOT_GAME` to the game you want the bot to be "playing"
    * Set `ActualChannelIdHere_CLIENT_TOKEN` to the DialogFlow Client Access Token to be used for each channel you want the bot to respond in (replace ActualChannelIdHere with the actual channel ID).
4. Run with `ruby phoenix.rb`

---

## DialogFlow

### Overview
DialogFlow is an API that is very similar in functionality to Siri, Alexa, Cortana, Google Assistant, etc. For this project, we're using the text-based, machine-learning portion to detect topics and when to produce replies. Conveniently, a DialogFlow agent can be edited collaboratively and updates immediately, so multiple people can provide topics and responses for the bot without having to restart the bot nor have access to the bot's hosting.

### Configuring
1. Create an agent (and set the token to the environment as listed above)
2. Delete the default fallback and welcome intents!
3. Create an intent (name doesn't matter but should reflect the topic of the autoreply)
4. Provide example phrases in the Training phrases and one or more replies in the Responses section (see image below)
5. Repeat steps 3-4 for every topic you want the bot to cover

![DialogFlow](https://i.imgur.com/i6bQhsk.png)

---

## FAQ

### Can I add Phoenix (your copy) to my server?
Probably not. I might take requests from people that frequently interact with my servers, but generally you should just host your own copy.

### Why did you do this on a per-channel basis instead of per-server?
First of all, you can use the same DialogFlow token multiple times if you wish; just set multiple CHANNELID-ClientToken environment variables to the same token. Secondly, this bot is meant for more in-depth replies; if you want more-basic autoreply functionality I'm sure there are other bots out there that already do this.

### Why use DialogFlow instead of looking for keywords?
Less work for more gain. DialogFlow is (generally) going to produce more-accurate results than simple keyword detection, and has the added benefit of already having an easy-to-use, collaborative interface.

### Why did you use Ruby for this?
I felt like trying something new; I'd never written/run Ruby before, so why not?
