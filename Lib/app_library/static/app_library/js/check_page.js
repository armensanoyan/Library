pagetitle = document.getElementsByClassName('pagetitle')
title = pagetitle[0].outerText
icons = document.getElementsByClassName('manubaricon')

if (title == 'Profile') {
	for(let i=0; i<2; i++) {
		icons[i].style.display="none"
		console.log(icons[i])
	}
} else {
	for(let i=0; i<2; i++) {
		icons[i].style.display="inline"
		console.log(icons[i])
	}
}