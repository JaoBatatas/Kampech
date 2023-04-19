function show() {
    const stylesheet = document.styleSheets[0];
    let elementRules;
    // let searchBar = document.querySelector(".searchBar")

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
        else{
            alert("Buscnado");
        }
    }
}




// if (email_box.value == '') {
//     alert ("Campo vazio");
// } else {
//     alert("Redirecionando")
// }