$('a.reply-button').click (e)->
  e.preventDefault()
  parent_id = $(this).parents('.message')[0].id
  reply_form = $('#master_reply_form form').clone()
  reply_form.find('#message_parent_id').attr('value', parent_id)
  $(this).closest('.message').children('.reply_form').append(reply_form)

# cancel reply
$('body').on 'click', 'a.cancel-reply', (e) ->
  e.preventDefault()
  $('body .reply_form form').remove()

$('body').on 'click', 'a.useful-button', (e) ->
  e.preventDefault()
  message_id = $(this).parents('.message')[0].id
  $(@).attr('disabled', 'disabled')
  $(@).text('Saving..')
  $.post '/ratings', {message_id: message_id}, success: ->
    # take response with message id, and update the useful button

$('body').on 'click', 'input.submit_message_button', (e) ->
  $(this).attr('value', 'Saving..')
