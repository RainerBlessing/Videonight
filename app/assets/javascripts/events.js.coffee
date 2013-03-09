# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $.expr[":"].r = (obj, index, meta, stack) ->
    $(obj).attr("rel") is meta[3]
  $('a:r(imdb_query)').click ->
    input = $(this).parent().parent().find('input')
    input_title=$(input[0])
    input_imdb_id=$(input[1])
    movie = { title: input_title, title_value: input_title.attr('value'), imdb_id: input_imdb_id, imdb_id_value: input_imdb_id.attr('value') }
    if movie.imdb_id_value.length > 0
      query_id(movie)
    else if movie.title_value.length > 0
      query_title(movie)
    return false
  $('.movie').each ->
    id = $(this).attr('id')
    $.getJSON "http://www.imdbapi.com/?i=" + id + "&callback=?", (data) =>
      $(this).find('.imdb_rating').text data.imdbRating
query_id = (movie) ->
  @movie = movie
  $.getJSON "http://www.imdbapi.com/?i=" + @movie.imdb_id_value + "&callback=?", (data) =>
    @movie.imdb_id_value = data.imdbID
    @movie.title_value = data.Title
    set_movie(@movie)
query_title = (movie) ->
  @movie = movie
  $.getJSON "http://www.imdbapi.com/?t=" + @movie.title_value + "&callback=?", (data) =>
    @movie.imdb_id_value = data.imdbID
    @movie.title_value = data.Title
    set_movie(@movie)

set_movie = (movie) ->
  movie.title.val(movie.title_value)
  movie.imdb_id.val(movie.imdb_id_value)

remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val "1"
  $(link).closest(".fields").hide()

add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  $(link).before content.replace(regexp, new_id)

@remove_fields = remove_fields
@add_fields = add_fields
