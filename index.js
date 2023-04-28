
// Search Bar Animation
function searchBar_slide() {
    const stylesheet = document.styleSheets[0];
    let elementRules;

    for (let i = 0; i < stylesheet.cssRules.length; i++) {
        if (stylesheet.cssRules[i].selectorText === '#searchBar') {
            elementRules = stylesheet.cssRules[i];
        }
    }

    if (elementRules.style.display === 'none') {
        elementRules.style.display = 'block';
    }
    else {
        if (searchBar.value == '') {
            alert("Campo vazio");
        }
        else {
            alert("Buscnado");
        }
    }
}

// Cart PopUp Animation
function cartAnimation() {
    const stylesheet = document.styleSheets[0];
    let elementRules;

    for (let i = 0; i < stylesheet.cssRules.length; i++) {
        if (stylesheet.cssRules[i].selectorText === '.cartPopUp') {
            elementRules = stylesheet.cssRules[i];
        }
    }

    if (elementRules.style.display === 'none') {
        elementRules.style.display = 'flex';
    }
    else {
       elementRules.style.display = 'none';
    }
}

// Phone Number Mask
const handlePhone = (event) => {
    let input = event.target
    input.value = phoneMask(input.value)
}

const phoneMask = (value) => {
    if (!value) return ""
    value = value.replace(/\D/g, '')
    value = value.replace(/(\d{2})(\d)/, "($1) $2")
    value = value.replace(/(\d)(\d{4})$/, "$1-$2")
    return value
}

// Change Itens Quantity
const quantityGroupClass = "CLASS-NAME-HERE"
const quantityIncrementButtonClass = "CLASS-NAME-HERE"
const quantityDecrementButtonClass = "CLASS-NAME-HERE"
const quantityNumberFieldClass = "CLASS-NAME-HERE"

// Increment
$(document).on('click', `.${quantityIncrementButtonClass}`, function(){
  var $input = $(this).closest(`.${quantityGroupClass}`).find(`.${quantityNumberFieldClass}`);    
  var val = parseInt($input.val(), 10);
  $input.val(val + 1);
  $input[0].dispatchEvent(new Event('change'));
});

// Decrement
$(document).on('click', `.${quantityDecrementButtonClass}`, function(){
  var $input = $(this).closest(`.${quantityGroupClass}`).find(`.${quantityNumberFieldClass}`);    
  var val = parseInt($input.val(), 10);
  $input.val(Math.max(val - 1, 1));
  $input[0].dispatchEvent(new Event('change'));
});