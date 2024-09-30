function confirmSubmit() {
	return confirm("¿Estás seguro de que quieres cancelar tu confirmación?");
}


let list = document.querySelectorAll('.mainUl li');

function activeLink(){
	list.forEach((item)=>
	item.classList.remove('hovered'));
	this.classList.add('hovered');
}

list.forEach((item)=>
item.addEventListener('mouseover', activeLink));


let toggle = document.querySelector('.toggle');
let navigation = document.querySelector('.navigation');
let main = document.querySelector('.main');

toggle.onclick = function(){
	navigation.classList.toggle('active');
	main.classList.toggle('active');
}


const trans1 = document.getElementById('trans1');
const trans2 = document.getElementById('trans2');
const trans3 = document.getElementById('trans3');
const trans4 = document.getElementById('trans4');
const trans5 = document.getElementById('trans5');
const trans6 = document.getElementById('trans6');
const trans7 = document.getElementById('trans7');
const trans8 = document.getElementById('trans8');
const trans9 = document.getElementById('trans9');

const cargarTrans = (entradas, observador) => {
	entradas.forEach((entrada) => {
		if(entrada.isIntersecting){
			entrada.target.classList.add('trans');
		}
	})
}

const observador = new IntersectionObserver(cargarTrans, {
	root: null,
	rootMargin: '0px 0px 0px 0px',
	threshold: 0.5
});

const cargarTransImg = (entradas, observador) => {
	entradas.forEach((entrada) => {
		if(entrada.isIntersecting){
			entrada.target.classList.add('trans');
		}
	})
}

const observadorImg = new IntersectionObserver(cargarTransImg, {
	root: null,
	rootMargin: '0px 0px 0px 0px',
	threshold: 0.2
});


observador.observe(trans1);
observador.observe(trans2);
observador.observe(trans3);
observador.observe(trans4);
observadorImg.observe(trans5);
observador.observe(trans6);
observador.observe(trans7);
observador.observe(trans8);
observador.observe(trans9);

