module.exports = (robot) ->
  robot.respond /help/i, (msg) ->
    msg.send "To talk to our bot you can reference it by using lnms-bot, lnms-bot: or @lnms-bot"
    msg.send "Currently you can ask it:"
    msg.send "help - displays this response"
    msg.send "docs - links to our documentation, you can also pass on arguments for the docs you want such as lnms-bot: docs api"
    msg.send "team - this will list the team members"
