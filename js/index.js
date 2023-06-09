// Função de animação da barra de pesquisa
function searchBar_slide() {
    const stylesheet = document.styleSheets[0];
    let elementRules;

    // Localiza as regras de estilo para a barra de pesquisa
    for (let i = 0; i < stylesheet.cssRules.length; i++) {
        if (stylesheet.cssRules[i].selectorText === '#headerSearchBar') {
            elementRules = stylesheet.cssRules[i];
        }
    }

    // Altera a propriedade 'display' das regras de estilo da barra de pesquisa
    if (elementRules.style.display === 'none') {
        elementRules.style.display = 'block';
    } else {
        if (headerSearchBar.value == '') {
            alert("Campo vazio");
        } else {
            alert("Buscando");
        }
    }
}

// Função para limpar a barra de pesquisa
function clearSearchBar() {
    document.getElementById('purchaseSearchBar').value = '';
}

// Função para lidar com a resposta de autenticação do servidor e redirecionar a página
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
        '100%blackblack': 'https://prod.spline.design/riP58C8ficoDNNuu/scene.splinecode',
        '100%blackwhite': 'https://prod.spline.design/NFiGBLbJ6V3XiEkz/scene.splinecode',
        '100%blackpurple': 'https://prod.spline.design/QYLKf5yCkc5Sxy8l/scene.splinecode',
        '100%whiteblack': 'https://prod.spline.design/N0ljuia9sIenO5UH/scene.splinecode',
        '100%whitewhite': 'https://prod.spline.design/99jv4ZG0HMSU0KTA/scene.splinecode',
        '100%whitepurple': 'https://prod.spline.design/bUsPvojqlA5fvqee/scene.splinecode',
        '100%greyblack': 'https://prod.spline.design/BSXMu810s6CUqcEv/scene.splinecode',
        '100%greywhite': 'https://prod.spline.design/W2h06fpl7td3SNgo/scene.splinecode',
        '100%greypurple': 'https://prod.spline.design/dAaUNgdXuxjypcpC/scene.splinecode',
        '80%blackblack': 'https://prod.spline.design/z6IecvAvHBBa8BH3/scene.splinecode',
        '80%blackwhite': 'https://prod.spline.design/5tHQdCRDHutcUdhH/scene.splinecode',
        '80%blackpurple': 'https://prod.spline.design/HyRf0zx0p7SB0Jzl/scene.splinecode',
        '80%whiteblack': 'https://prod.spline.design/DBB6Q0geYAaO0o9G/scene.splinecode',
        '80%whitewhite': 'https://prod.spline.design/nEnrBYIteNh7FZBZ/scene.splinecode',
        '80%whitepurple': 'https://prod.spline.design/fdPg7Po2lABH4HB0/scene.splinecode',
        '80%greyblack': 'https://prod.spline.design/J58hIuD3nmt0nO0U/scene.splinecode',
        '80%greywhite': 'https://prod.spline.design/mFIWVNJn03JvOSM9/scene.splinecode',
        '80%greypurple': 'https://prod.spline.design/wkpoKjn0-igynQGE/scene.splinecode',
        '75%blackblack': 'https://prod.spline.design/WfwHEmYIhnQmG90g/scene.splinecode',
        '75%blackwhite': 'https://prod.spline.design/ckrFd9e7X-WEh-0A/scene.splinecode',
        '75%blackpurple': 'https://prod.spline.design/0MZBvNuS5SXkWZgE/scene.splinecode',
        '75%whiteblack': 'https://prod.spline.design/IksRGNkdKjIHw3hc/scene.splinecode',
        '75%whitewhite': 'https://prod.spline.design/OAV3ZjWFF9eQdwcA/scene.splinecode',
        '75%whitepurple': 'https://prod.spline.design/dr9yMZpfqhP2OqMC/scene.splinecode',
        '75%greyblack': 'https://prod.spline.design/qN6LcJ6bMxJppUup/scene.splinecode',
        '75%greywhite': 'https://prod.spline.design/r3ApzAUWOjfUEkew/scene.splinecode',
        '75%greypurple': 'https://prod.spline.design/4vqJvWSjM43FZHzi/scene.splinecode',
        '60%blackblack': 'https://prod.spline.design/XRUVXXtTzTN0HBiU/scene.splinecode',
        '60%blackwhite': 'https://prod.spline.design/bwPNdicmiIErryD6/scene.splinecode',
        '60%blackpurple': 'https://prod.spline.design/R3AUWwqJe2Gvn5MD/scene.splinecode',
        '60%whiteblack': 'https://prod.spline.design/r0ljjLXEjMzHqKJ6/scene.splinecode',
        '60%whitewhite': 'https://prod.spline.design/xCdWYWkeU-29Hdeh/scene.splinecode',
        '60%whitepurple': 'https://prod.spline.design/jYlyb6NicHhj8fTH/scene.splinecode',
        '60%greyblack': 'https://prod.spline.design/wa9nZJi8EsWECR4f/scene.splinecode',
        '60%greywhite': 'https://prod.spline.design/34UwbWsV44wz9OMd/scene.splinecode',
        '60%greypurple': 'https://prod.spline.design/oyNP-rHyTkN6UJa2/scene.splinecode'
    };

    const keyCombination = size + board + key;

    // Remove o elemento spline-viewer existente
    const existingSpline = document.querySelector('.customLeft_img');
    if (existingSpline) {
        existingSpline.remove();
    }

    // Cria um novo elemento spline-viewer
    const newSpline = document.createElement('spline-viewer');
    newSpline.setAttribute('url', splines[keyCombination]);
    newSpline.setAttribute('class', 'customLeft_img');

    // Adiciona o novo elemento spline-viewer ao contêiner
    if (splineContainer) {
        splineContainer.appendChild(newSpline);
    } else {
        console.error("Elemento splineContainer não encontrado.");
    }
}