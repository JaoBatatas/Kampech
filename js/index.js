
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

// Função para trocar o projeto spline
function changeSpline() {
    const size = document.getElementById('selSize').value;
    const board = document.getElementById('selBoardColor').value;
    const key = document.getElementById('selKeyColor').value;
    const splineContainer = document.getElementById('splineContainer');

    const splines = {
        '100%blackblack': 'https://prod.spline.design/cW7bW4TYB3bfz9y8/scene.splinecode',
        '100%blackwhite': 'https://prod.spline.design/IUAuwHM96lx37KS2/scene.splinecode',
        '100%blackpurple': 'https://prod.spline.design/Ya3fD33tmfh2hNfr/scene.splinecode',
        '100%whiteblack': 'https://prod.spline.design/N0ljuia9sIenO5UH/scene.splinecode',
        '100%whitewhite': 'https://prod.spline.design/99jv4ZG0HMSU0KTA/scene.splinecode',
        '100%whitepurple': 'https://prod.spline.design/bUsPvojqlA5fvqee/scene.splinecode',
        '100%greyblack': 'https://prod.spline.design/BSXMu810s6CUqcEv/scene.splinecode',
        '100%greywhite': 'https://prod.spline.design/W2h06fpl7td3SNgo/scene.splinecode',
        '100%greypurple': 'https://prod.spline.design/wlhcXxjekxg69Hz2/scene.splinecode',
        '80%blackblack': 'https://prod.spline.design/Fg-vUiK0gnP9Z2DW/scene.splinecode',
        '80%blackwhite': 'https://prod.spline.design/sYHjtd-HqWKieoew/scene.splinecode',
        '80%blackpurple': 'https://prod.spline.design/QKfImCOlgi8KGcO5/scene.splinecode',
        '80%whiteblack': 'https://prod.spline.design/DBB6Q0geYAaO0o9G/scene.splinecode',
        '80%whitewhite': 'https://prod.spline.design/nEnrBYIteNh7FZBZ/scene.splinecode',
        '80%whitepurple': 'https://app.spline.design/file/aea5eba7-ff7d-46f3-8625-0f779238ad5b',
        '80%greyblack': 'https://prod.spline.design/J58hIuD3nmt0nO0U/scene.splinecode',
        '80%greywhite': 'https://prod.spline.design/mFIWVNJn03JvOSM9/scene.splinecode',
        '80%greypurple': 'https://prod.spline.design/wkpoKjn0-igynQGE/scene.splinecode',
        '75%blackblack': '',
        '75%blackwhite': '',
        '75%blackpurple': '',
        '75%whiteblack': '',
        '75%whitewhite': '',
        '75%whitepurple': '',
        '75%greyblack': '',
        '75%greywhite': '',
        '75%greypurple': '',
        '60%blackblack': '',
        '60%blackwhite': '',
        '60%blackpurple': '',
        '60%whiteblack': '',
        '60%whitewhite': '',
        '60%whitepurple': '',
        '60%greyblack': '',
        '60%greywhite': '',
        '60%greypurple': ''
    };

    const keyCombination = size + board + key;

    // Remove existing spline-viewer element
    const existingSpline = document.querySelector('.customLeft_img');
    if (existingSpline) {
        existingSpline.remove();
    }

    // Create a new spline-viewer element
    const newSpline = document.createElement('spline-viewer');
    newSpline.setAttribute('url', splines[keyCombination]);
    newSpline.setAttribute('class', 'customLeft_img');

    // Append the new spline-viewer element to the container
    if (splineContainer) {
        splineContainer.appendChild(newSpline);
    } else {
        console.error("splineContainer element not found.");
    }
}  