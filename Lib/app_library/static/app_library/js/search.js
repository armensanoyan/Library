var filtered_books = []
element = {}

fetch('http://localhost:8000/ajax/books')
  .then(res => res.json())
  .then(res => books = res)

function closeAllLists(elmnt) {
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != element) {
        x[i].parentNode.removeChild(x[i]);
    }
  }
}
document.addEventListener("click", function (e) {
    closeAllLists(e.target);
});


addEventListener('input',function (e){
  element = document.getElementById(e.target.id)
	val = element.value
	filed_name = e.target.id
	closeAllLists()
	if (val == '') {
		return true
	}

	a = document.createElement("DIV");
	a.style.height = '10em'
	a.style.overflowX = 'hidden'
  a.setAttribute("id", this.id + "autocomplete-list");
  a.setAttribute("class", "autocomplete-items");
	document.getElementById(e.target.id).parentNode.appendChild(a);

  filtered_books = []
	for (i = 0; i < books.length; i++) {
    if (books[i]['fields'][filed_name].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
      filtered_books.indexOf(books[i]) === -1 ? filtered_books.push(books[i]): ''
      b = document.createElement("DIV");
      // write html code in backticks and insert in div using innerhtml,
      // which is more understandable
      b.innerHTML = "<strong>" + books[i]['fields'][filed_name].substr(0, val.length) + "</strong>";
      b.innerHTML += books[i]['fields'][filed_name].substr(val.length);
      b.innerHTML += "<input type='hidden' value='" + books[i]['fields'][filed_name] + "'>";
      
		
		  b.addEventListener("click", function(env) {
        element.value = this.getElementsByTagName("input")[0].value;
        closeAllLists();
		  });
    a.appendChild(b);
		}
  }
})


function submit() {
	console.log('submit')
}