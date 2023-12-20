import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ChatChannel", chat_type: "private", user_id: 1 }, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to ChatChannel');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Disconnected from ChatChannel');
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('Received data:', data);
  }
});
