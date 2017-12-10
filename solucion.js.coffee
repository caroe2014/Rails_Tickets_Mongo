$ ->
  $("#cp").accordion()

  if `"WebSocket" in window`
    socket = new WebSocket("ws://localhost:8080") 

  socket.onopen = =>
    console.log("Connection Open")
    init = {
      sender: "cp"
      action: "init"
      user:   <%= @user.id %>
      token:  <%= cookies["remember_token"] %>
    }

    socket.send(init.to_json)

  socket.onerror = (e)=>
    console.log(e)

  socket.onclose = =>
    console.log("Closed")

  socket.onmessage = (m)=>
    console.log("Recieved: #{m.data}")
    msg = m.data.JSON.parse
    switch msg.action
      when "ret_init"

      when "friend_udt"
        refreshFriend()

refreshFriend() ->
  html = "<%= j render 'layouts/friends' %>"
  $('#friends').empty()
  $('#friends').add(html)