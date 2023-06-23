
// Search Bar Animation
function searchBar_slide() {
    const stylesheet = document.styleSheets[0];
    let elementRules;

    for (let i = 0; i < stylesheet.cssRules.length; i++) {
        if (stylesheet.cssRules[i].selectorText === '#headerSearchBar') {
            elementRules = stylesheet.cssRules[i];
        }
    }

    if (elementRules.style.display === 'none') {
        elementRules.style.display = 'block';
    }
    else {
        if (headerSearchBar.value == '') {
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

function changeClass() {
    const stylesheet = document.styleSheets[0];
    let elementRules;
    
    for (let i = 0; i < stylesheet.cssRules.length; i++) {
        if (stylesheet.cssRules[i].selectorText === '#oneMonthFilter') {
            elementRules = stylesheet.cssRules[i];
        }
    }

    if (elementRules.style.background === '#F3F5F8') {
        elementRules.style.background = 'black';
    }
    else {
        elementRules.style.background = '#F3F5F8';
    }
}

// Clear searchBar
function clearSearchBar() {
    document.getElementById('purchaseSearchBar').value = '';
}

// Função para redirecionar com base na resposta do servidor
function handleAuthenticationResponse(response) {
    if (response.ok) {
        // Se o servidor retornar uma resposta bem-sucedida, redireciona para personalInfo.html
        window.location.href = '/personalInfo.html';
    } else {
        // Caso contrário, redireciona para login.html
        window.location.href = '/login.html';
    }
}

// Ouvinte de eventos para redirecionar quando o usuário clicar no ícone de conta
document.querySelector('.accountIcon').addEventListener('click', function (event) {
    event.preventDefault(); // Impede o comportamento padrão do link

    fetch('/getPersonalInfo')
        .then(handleAuthenticationResponse)
        .catch(error => {
            console.log('Erro ao verificar autenticação:', error);
            // Em caso de erro, redireciona para login.html por padrão
            window.location.href = '/login.html';
        });
});