
expand = (text)->
  text
    .replace /&/g, '&amp;'
    .replace /</g, '&lt;'
    .replace />/g, '&gt;'

encode = (text)->
  text
    .replace /\s/g, '_'
    .replace /'/g, '%27'
    .replace /^Data:/, ''

emit = ($item, item) ->
  $item.append """
    <div style="background-color:#eee;padding:15px;">
      <p>
        #{expand item.text}
      </p>
      <p class=caption>wait</p>
    </div>
  """

  output = null
  $item.addClass 'radar-source'
  $item.get(0).radarData = -> output

  $.getJSON "https://commons.wikimedia.org/w/api.php?action=jsondata&formatversion=2&format=json&origin=*&title=#{encode item.text}", (result) ->
    rows = result.jsondata.data
    cols = result.jsondata.schema.fields
    $item.find('.caption').text "done #{rows.length} x #{cols.length}"
    output = {}
    for i in [1..cols.length-1]
      output[cols[i].title] = rows[rows.length-1][i]
    console.log result, output
    

bind = ($item, item) ->
  $item.dblclick -> wiki.textEditor $item, item

window.plugins.tab = {emit, bind} if window?
module.exports = {encode} if module?

