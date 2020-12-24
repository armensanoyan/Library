var filtered_books = []
element = {}
books = []

fetch('http://localhost:5000/ajax/books')
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
	id = filed_name+'-container'
	a = document.createElement('DIV')
	a.style.height = '12em'
	a.style.overflowX = 'hidden'
	a.style.backgroundColor = "#a58c68de"
	a.style.borderRadius = "3px"
	a.style.padding = "5px"
	a.style.marginTop = "1ex"

  	a.setAttribute("id", "autocomplete-list");
  	a.setAttribute("class", "autocomplete-items col-sm-4");
	document.getElementById(e.target.id).parentNode.appendChild(a);

  	filtered_books = []
	for (i = 0; i < books.length; i++) {
		each_field_name = books[i]['fields'][filed_name]

    	if (each_field_name.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
      		filtered_books.indexOf(books[i]) === -1 ? filtered_books.push(books[i]): ''
			b = document.createElement("DIV");
			  
			let other_filed = filed_name == 'title' ? 'author': 'title'

			// write html code in backticks and insert in div using innerhtml,
			// which is more understandable
      		b.innerHTML = "<strong>" + each_field_name.substr(0, val.length) + "</strong>";
      		b.innerHTML += each_field_name.substr(val.length) + ' - ' + books[i]['fields'][other_filed];
      		b.innerHTML += "<input type='hidden' value='" + each_field_name + "'>";
			
		
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