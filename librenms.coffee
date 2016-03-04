module.exports = (robot) ->
  github = "https://github.com/librenms/librenms"
  robot.respond /team/i, (msg) ->
    msg.send "blahdeblah, laf, f0o, Rosiak, SaaldjorMike, murrant"
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
