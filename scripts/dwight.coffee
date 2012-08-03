# Description:
#   Eliot awesomeness
#
# Dependencies:
#   None
#
# Configuration:
#   None
#

module.exports = (robot) ->

  robot.hear /dwight/i, (msg)->
    askChuck msg, "http://api.icndb.com/jokes/random?firstName=Dwight&lastName=Merriman&limitTo=[nerdy]"

  askChuck = (msg, url) ->
    msg.http(url)
      .get() (err, res, body) ->
        if err
          msg.send "Dwight Says: #{err}"
        else
          message_from_chuck = JSON.parse(body)
          if message_from_chuck.length == 0
            msg.send "Achievement unlocked: Eliot is quiet!"
          else
            msg.send message_from_chuck.value.joke
