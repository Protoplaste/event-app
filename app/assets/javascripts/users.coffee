# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.datepicker.date').datepicker({
    dateFormat: 'dd/mm/yy',
    autoclose: true
  })

  $('#datepicker').datepair({
    startClass: 'start',
    endClass: 'end',
    parseDate: (input) ->
      return $(input).datepicker('getDate')
    ,
    updateDate: (input, dateObj) ->
      $(input).datepicker('setDate', 'dateObj')
  })