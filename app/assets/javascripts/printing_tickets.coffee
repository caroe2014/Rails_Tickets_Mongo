# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  materials = $('#printing_ticket_material_id').html()
  equipments = $('#printing_ticket_equipment_id').html()
  console.log(materials)  
  $('#printing_ticket_location_id').on "click", ->
    location = $('#printing_ticket_location_id :selected').text()
    optionsm = $(materials).filter("optgroup[label='#{location}']").html()
    if optionsm
       $('#printing_ticket_material_id').html(optionsm)
    else
       $('#printing_ticket_material_id').empty()
  
    optionse = $(equipments).filter("optgroup[label='#{location}']").html()
    if optionse
       $('#printing_ticket_equipment_id').html(optionse)
    else
       $('#printing_ticket_equipment_id').empty()
