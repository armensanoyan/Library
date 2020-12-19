fetch('http://localhost:8000/ajax/books')
  .then(res => res.json())
  .then(res => books = res)

function reorder(id) {
	console.log('reorder by',id)
	console.log(books)

}