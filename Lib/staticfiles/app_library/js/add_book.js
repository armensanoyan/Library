function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
const csrftoken = getCookie('csrftoken');
// use fatch to simplify
function send_book(id) {
	xml = new XMLHttpRequest()
	xml.onreadystatechange = response => console.log('response: ', response)
	xml.open('POST', `http://localhost:8000/user_book`)
	xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xml.setRequestHeader('X-CSRFToken', csrftoken);
	xml.send(`id=${id}`);
}

function add_book(event) {
	send_book(event.target.id)
  }