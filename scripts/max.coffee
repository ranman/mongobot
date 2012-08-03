# Description:
#   Max awesomeness
#
# Dependencies:
#   None
#
# Configuration:
#   None
#

module.exports = (robot) ->

  robot.hear /max/i, (msg)->
    askChuck msg, "http://api.icndb.com/jokes/random?firstName=Max&lastName=Schireson&limitTo=[nerdy,bruce schneier]"

  askChuck = (msg, url) ->
    msg.http(url)
      .get() (err, res, body) ->
        if err
          msg.send "Max says: #{err}"
        else
          message_from_chuck = JSON.parse(body)
          if message_from_chuck.length == 0
            msg.send "Achievement unlocked: Max is quiet!"
          else
            msg.send message_from_chuck.value.joke
