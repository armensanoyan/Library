function send_book(id) {
	xml = new XMLHttpRequest()
	xml.open('GET', `http://localhost:8000/user_book?q=${id}`)
	xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	// xml.onreadystatechange = function() { 
	//     if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
	//     }
	// }
	xml.send();
}

function add_book(event) {
	send_book(event.target.id)
  }