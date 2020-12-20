pagetitle = document.getElementsByClassName('pagetitle')
title = pagetitle[0].outerText
icons = document.getElementsByClassName('manubaricon')

if (title == 'Profile') {
	for(let i=0; i<2; i++) {
		icons[i].style.display="none"
	}
} else {
	for(let i=0; i<2; i++) {
		icons[i].style.display="inline"
	}
}