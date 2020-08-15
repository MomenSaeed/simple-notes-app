import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const note_element = document.getElementById('note-id');
  const note_id = note_element ? note_element.getAttribute('data-note-id') : 0;
  // note_id = note_id ? note_id : 0;

  consumer.subscriptions.create({ channel: "NoteChannel", note_id: note_id }, {
    connected() {
      console.log("connected to Note Channel..");
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log("streaming from note channel - " + note_id);
      // console.log(data.title);
      if (note_id == data.id) {
        const body_element = document.getElementById('note-body-input-' + note_id);
        body_element.value = data.body;
        const title_element = document.getElementById('note-title-input-' + note_id);
        title_element.value = data.title;
      }
    }
  });
})
