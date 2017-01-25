# tab plugin, server-side component
# These handlers are launched with the wiki server. 

startServer = (params) ->
  app = params.app
  argv = params.argv

  app.get '/plugin/tab/:thing', (req, res) ->
    thing = req.params.thing
    res.json {thing}

  app.post "/plugin/tab/commons", (req, res) ->
    params = req.body
    title = params.url
      .replace /^https:\/\/commons\.wikimedia\.org\/wiki\//, ''
      .replace /^Data:/,''
      .replace /\.tab$/,''
      .replace /_/g, ' '
    res.send
      title: title
      story:
        [{
          id: '0023840938'
          type: 'paragraph'
          text: "Transported from Wikipedia Commons. [#{params.url} page]"
        },
        {
          id: '8093840982'
          type: 'tab'
          text: title
          params: params
        }]

module.exports = {startServer}
