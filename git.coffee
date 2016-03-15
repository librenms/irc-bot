module.exports = (robot) ->
  robot.respond /latest (version|commit)/i, (msg) ->
    github = "https://api.github.com/repos/librenms/librenms/"
    msg.http("#{github}branches/master")
      .get() (err, res, body) ->
        json     = JSON.parse(body)
        sha      = json['commit']['sha']
        message  = json['commit']['commit']['message']
        date     = json['commit']['commit']['author']['date']
        msg.send "Latest commit is #{sha} (#{message}) at #{date}"
