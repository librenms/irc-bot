module.exports = (robot) ->
  robot.respond /docs([ ]*)(.*)/i, (msg) ->
    service = "http://docs.librenms.org"
    wanted     = msg.match[2].toLowerCase()
    docs = 
      api: "/API/API-Docs/"
      alerting: "/Extensions/Alerting/"
      distributed: "/Extensions/Distributed-Poller/"
      mibpolling: "/Extensions/MIB-based-polling/"
      influx: "/Extensions/InfluxDB/"
      influxdb: "/Extensions/InfluxDB/"
      oxidized: "/Extensions/Oxidized/"
      smokeping: "/Extensions/Smokeping/"
    if wanted and docs[wanted]
      selected = docs[wanted]
      msg.send "Are you looking for: #{service}#{selected}"
    else
      msg.send "#{service}"
