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

function send_book(id) {
	xml = new XMLHttpRequest()
	xml.open('POST', `http://localhost:8000/user_book`)
	xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xml.setRequestHeader('X-CSRFToken', csrftoken);
	xml.send(`name=${id}`);
}

function add_book(event) {
	send_book(event.target.id)
  }