module.exports = (robot) ->
  github = "https://github.com/librenms/librenms"
  channel = "##librenms"
  nick = process.env.HUBOT_IRC_NICK
  moderators = ["blahdeblah", "f0o", "laf", "murrant", "Rosiak", "SaaldjorMike"]
  robot.respond /team/i, (msg) ->
    msg.send "blahdeblah, f0o, laf, murrant , Rosiak, SaaldjorMike"
  robot.hear /creat(e|ing) an issue/i, (msg) ->
    msg.send "You can create an issue on github: #{github}/issues"
  robot.hear /(poller|discovery) (.*)([ ]*)debug/i, (msg) ->
    type = msg.match[1].toLowerCase()
    module = msg.match[2].toLowerCase()
    if type is "poller"
        poller_flags = "-r -f"
    else
        poller_flags = ""
    if module
      module = "-m #{module}"
    else
      module = ""
    msg.send "./#{type}.php #{poller_flags} #{module} -h HOSTNAME -d"
  robot.hear /(.*) validate your install/i, (msg) ->
    user = msg.match[1]
    msg.send "#{user} to validate your install run ./validate.php"
  robot.hear /(good|awesome|cool|sexy) bot/i, (msg) ->
    msg.reply "Aw, thanks :)"
  robot.hear /(bad|silly|stupid|lame|crap) bot/i, (msg) ->
    msg.reply "Why so mean :("
  robot.hear /(flip|flipping) tables/i, (msg) ->
    msg.send "AGHHHHHHHHHHH"
    msg.send "(╯°□°）╯︵ ┻━┻"
  robot.hear /(.*)allah is doing(.*)/i, (msg) ->
    user = msg.message.user.name
    robot.adapter.command "KICK", channel, user, nick, "Not here!"
  robot.enter (msg) ->
    user = msg.message.user.name
    if user in moderators
      robot.adapter.command 'MODE', msg.message.user.room, '+o', user
  robot.respond /op me/i, (msg) ->
    user = msg.message.user.name
    if user in moderators
      robot.adapter.command 'MODE', msg.message.user.room, '+o', user
    
