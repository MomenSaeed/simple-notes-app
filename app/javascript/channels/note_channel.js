import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const note_element = document.getElementById('note-id');
  const note_id = note_element ? note_element.getAttribute('data-note-id') : 0;
  const user_element = document.getElementById('user-id');
  const user_id = user_element ? user_element.getAttribute('data-user-id') : 0;
  let collaborator_emails = [];

  consumer.subscriptions.create({ channel: "NoteChannel", note_id: note_id }, {
    connected() {
      console.log("connected to Note Channel..");
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // console.log(data);
      // Called when there's incoming data on the websocket for this channel
      console.log("streaming from note channel - " + note_id);
      // console.log(data.title);
      if (note_id == data.id) {
        const body_element = document.getElementById('note-body-input-' + note_id);
        body_element.value = data.body;
        const title_element = document.getElementById('note-title-input-' + note_id);
        title_element.value = data.title;
      }
      if (note_id == data.id && data.collaborator && user_id != data.collaborator.id && !collaborator_emails.includes(data.collaborator.email)) {
        const collaborators_table_element = document.getElementById('note-collaborators-table-' + note_id);
        let html = '<tr><td>' + data.collaborator.email +  '</td><tr>';
        collaborators_table_element.innerHTML = collaborators_table_element.innerHTML + html;
        collaborator_emails.push(data.collaborator.email);
      }
    }
  });
})
