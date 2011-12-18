# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.query_imdb_id').click ->
    input = $(this).prev()
    imdb_id = input.attr('value')
    $.getJSON "http://www.imdbapi.com/?i=" + imdb_id + "&callback=?", (data) ->
      array=(input.attr('id').split('_')[0...-1])
      array.push('name')
      name_input_id=array.join('_')
      $('#'+name_input_id).val(data.Title)
    return false
  $('.query_imdb_name').click ->
    input = $(this).prev()
    title = input.attr('value')
    $.getJSON "http://www.imdbapi.com/?t=" + title + "&callback=?", (data) ->
      array=(input.attr('id').split('_')[0...-1])
      array.push('imdbid')
      imdbid_input_id=array.join('_')
      $('#'+imdbid_input_id).val(data.ID)
    return false
