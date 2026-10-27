(function () {
    // CONFIGURACIÓN: aquí editas el menú de TODAS las páginas
   const LOGO = "assents/img/Barbería Robin's.jpeg";
    const PAGINA_LOGIN = "index.html";   // página de inicio de sesión

    const OPCIONES = [
        { href: "PID_inicio.html",        icono: "🏠", texto: "Inicio" },
        { href: "PID_inventario.html",    icono: "📦", texto: "Inventario" },
        { href: "PID_ventas.html",        icono: "🛒", texto: "Ventas" },
        { href: "PID_gastos.html",        icono: "💰", texto: "Gastos" },
        { href: "PID_reportes.html",      icono: "📊", texto: "Reportes" },
        { href: "PID_configuracion.html", icono: "⚙️", texto: "Configuración" }
    ];


    const raiz = document.getElementById("menu-root");
    if (!raiz) return;

    const paginaActual = decodeURIComponent(location.pathname.split("/").pop());

    const enlaces = OPCIONES.map(function (op) {
        const activo = op.href === paginaActual ? " activo" : "";
        return `
            <a href="${op.href}" class="menu-link${activo}">
                <span class="menu-icono">${op.icono}</span>
                ${op.texto}
            </a>`;
    }).join("");

    raiz.insertAdjacentHTML("beforebegin", `
        <button class="menu-btn" id="btnMenu" type="button" aria-label="Abrir o cerrar menú" aria-expanded="false">☰</button>
        <div class="menu-overlay" id="menuOverlay"></div>

        <aside class="menu-lateral" id="menuLateral">
            <div class="menu-logo">
                <img src="${LOGO}" alt="Logo de Barbería Robin's">
            </div>

            <nav class="menu-nav">${enlaces}</nav>

            <div class="menu-separador"></div>

            <a href="${PAGINA_LOGIN}" id="btnCerrarSesion" class="menu-cerrar-sesion">
                <span class="menu-icono">🚪</span>
                Cerrar sesión
            </a>
        </aside>
    `);
    raiz.remove();

    //  Abrir / cerrar
    const btnMenu = document.getElementById("btnMenu");
    const menuLateral = document.getElementById("menuLateral");
    const overlay = document.getElementById("menuOverlay");

    function alternarMenu(abrir) {
        const abierto = abrir !== undefined ? abrir : !menuLateral.classList.contains("menu-abierto");
        menuLateral.classList.toggle("menu-abierto", abierto);
        overlay.classList.toggle("visible", abierto);
        btnMenu.setAttribute("aria-expanded", abierto);
    }

    btnMenu.addEventListener("click", function () { alternarMenu(); });
    overlay.addEventListener("click", function () { alternarMenu(false); });
    document.addEventListener("keydown", function (e) {
        if (e.key === "Escape") alternarMenu(false);
    });
        // CAMBIO 3: Cerrar sesión
    const btnCerrarSesion = document.getElementById("btnCerrarSesion");

    btnCerrarSesion.addEventListener("click", function (e) {
        e.preventDefault();                        // evita ir directo al enlace
        alert("La sesión se cerró correctamente.");
        window.location.replace(PAGINA_LOGIN);     // vuelve al login
    });
})();