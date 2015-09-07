@app.filter 'votesFilter', ($sce) ->
  (input) ->
    result = "<span class='number'>#{Math.abs(input)}</span>"
    if input > 0
      result += "upvotes"
    else if input < 0
      result += "downvotes"
    else
      result += "votes"
    $sce.trustAsHtml(result)