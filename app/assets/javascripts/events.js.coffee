# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $.expr[":"].r = (obj, index, meta, stack) ->
    $(obj).attr("rel") is meta[3]
  $('a:r(imdb_query)').click ->
    input = $(this).parent().find('input')
    input_title=$(input[0])
    input_imdb_id=$(input[1])
    movie = { title: input_title, title_value: input_title.attr('value'), imdb_id: input_imdb_id, imdb_id_value: input_imdb_id.attr('value') }
    if movie.imdb_id_value.length > 0
      query_id(movie)
    else if movie.title_value.length > 0
      query_title(movie)
    return false

query_id = (movie) ->
  @movie = movie
  $.getJSON "http://www.imdbapi.com/?i=" + @movie.imdb_id_value + "&callback=?", (data) =>
    @movie.imdb_id_value = data.ID
    @movie.title_value = data.Title
    set_movie(@movie)
query_title = (movie) ->
  @movie = movie
  $.getJSON "http://www.imdbapi.com/?t=" + @movie.title_value + "&callback=?", (data) =>
    @movie.imdb_id_value = data.ID
    @movie.title_value = data.Title
    set_movie(@movie)

set_movie = (movie) ->
  movie.title.val(movie.title_value)
  movie.imdb_id.val(movie.imdb_id_value)
